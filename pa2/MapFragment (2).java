package me.ictlinkbd.com.projectalpha.map;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.ProgressBar;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.PopupMenu;
import androidx.core.view.GravityCompat;
import androidx.fragment.app.Fragment;

import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.android.libraries.places.api.Places;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.api.model.AutocompleteSessionToken;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.api.net.FetchPlaceRequest;
import com.google.android.libraries.places.api.net.FetchPlaceResponse;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsResponse;
import com.google.android.libraries.places.api.net.PlacesClient;
import com.mancj.materialsearchbar.MaterialSearchBar;
import com.mancj.materialsearchbar.adapter.SuggestionsAdapter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import me.ictlinkbd.com.projectalpha.R;
import me.ictlinkbd.com.projectalpha.util.DeviceLocation;

import static android.content.Context.INPUT_METHOD_SERVICE;
import static me.ictlinkbd.com.projectalpha.MainActivity.drawer;
import static me.ictlinkbd.com.projectalpha.util.ConstantValus.google_place_api;


public class MapFragment extends Fragment implements OnMapReadyCallback,
        MaterialSearchBar.OnSearchActionListener {


    private GoogleMap mMap;
    Marker marker = null;
    private List<Address> addressList;
    private Location lastLocation;
    private Geocoder geocoder;

    private PlacesClient placesClient;
    private List<AutocompletePrediction> predictionList;

    private Context context;
    private DeviceLocation deviceLocation;
    private LocationCallback locationCallback;
    private ProgressBar progressBar;
    private String TAG = "MapFragment ";
    public static final String MAPVIEW_BUNDLE_KEY = "MapViewBundleKey";
    private MapView mMapView;
    float zoom = 15.5f;

    private MaterialSearchBar searchBar;


    public MapFragment() {
        // Required empty public constructor
    }


    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        this.context = context;
        Log.e(TAG, "onAttach: called");
        deviceLocation = new DeviceLocation(context);
        geocoder = new Geocoder(context);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        Log.e(TAG, "onCreateView: called" );
        setHasOptionsMenu(true);
        View rootView = inflater.inflate(R.layout.fragment_map, container, false);

        Places.initialize(context, google_place_api);
        placesClient = Places.createClient(context);
        final AutocompleteSessionToken token = AutocompleteSessionToken.newInstance();
        addressList = new ArrayList<>();


        progressBar = rootView.findViewById(R.id.mapProgress);
        mMapView = rootView.findViewById(R.id.mapView);
        searchBar = rootView.findViewById(R.id.searchBar);
        searchBar.setOnSearchActionListener(this);
        searchBar.inflateMenu(R.menu.map_menu);
//        searchBar.setText("Hello World!");
        mMapView.getMapAsync(MapFragment.this);
        Log.d("LOG_TAG", getClass().getSimpleName() + ": text " + searchBar.getText());
        searchBar.setCardViewElevation(10);

        initGoogleMap(savedInstanceState);

        searchBar.addTextChangeListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                FindAutocompletePredictionsRequest predictionsRequest = FindAutocompletePredictionsRequest.builder()
                        .setTypeFilter(TypeFilter.ADDRESS)
                        .setSessionToken(token)
                        .setQuery(charSequence.toString())
                        .build();
                placesClient.findAutocompletePredictions(predictionsRequest).addOnCompleteListener(new OnCompleteListener<FindAutocompletePredictionsResponse>() {
                    @Override
                    public void onComplete(@NonNull Task<FindAutocompletePredictionsResponse> task) {
                        if (task.isSuccessful()) {
                            FindAutocompletePredictionsResponse predictionsResponse = task.getResult();
                            if (predictionsResponse != null) {
                                predictionList = predictionsResponse.getAutocompletePredictions();
                                List<String> suggestionsList = new ArrayList<>();
                                for (int i = 0; i < predictionList.size(); i++) {
                                    AutocompletePrediction prediction = predictionList.get(i);
                                    suggestionsList.add(prediction.getFullText(null).toString());
                                }
                                searchBar.updateLastSuggestions(suggestionsList);
                                if (!searchBar.isSuggestionsVisible()) {
                                    searchBar.showSuggestionsList();
                                }
                            }
                        } else {
                            Log.i("mytag", "prediction fetching task unsuccessful");
                        }
                    }
                });
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }

        });

        searchBar.setSuggestionsClickListener(new SuggestionsAdapter.OnItemViewClickListener() {
            @Override
            public void OnItemClickListener(int position, View v) {
                if (position >= predictionList.size()) {
                    return;
                }
                AutocompletePrediction selectedPrediction = predictionList.get(position);
                String suggestion = searchBar.getLastSuggestions().get(position).toString();
                searchBar.setText(suggestion);

                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        searchBar.clearSuggestions();
                    }
                }, 1000);
                InputMethodManager imm = (InputMethodManager) getActivity().getSystemService(INPUT_METHOD_SERVICE);
                if (imm != null)
                    imm.hideSoftInputFromWindow(searchBar.getWindowToken(), InputMethodManager.HIDE_IMPLICIT_ONLY);
                final String placeId = selectedPrediction.getPlaceId();
                List<Place.Field> placeFields = Arrays.asList(Place.Field.LAT_LNG);

                FetchPlaceRequest fetchPlaceRequest = FetchPlaceRequest.builder(placeId, placeFields).build();
                placesClient.fetchPlace(fetchPlaceRequest).addOnSuccessListener(new OnSuccessListener<FetchPlaceResponse>() {
                    @Override
                    public void onSuccess(FetchPlaceResponse fetchPlaceResponse) {

                        Log.d(TAG, "onSuccess: "+fetchPlaceResponse.toString());
                        Place place = fetchPlaceResponse.getPlace();

                        Log.i("mytag", "Place found: " + place.getName());
                        LatLng latLngOfPlace = place.getLatLng();
                        if (latLngOfPlace != null) {
                            mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(latLngOfPlace, zoom));
                        }
                    }
                }).addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        if (e instanceof ApiException) {
                            ApiException apiException = (ApiException) e;
                            apiException.printStackTrace();
                            int statusCode = apiException.getStatusCode();
                            Log.i("mytag", "place not found: " + e.getMessage());
                            Log.i("mytag", "status code: " + statusCode);
                        }
                    }
                });
            }

            @Override
            public void OnItemDeleteListener(int position, View v) {
                searchBar.clearSuggestions();
            }
        });


        return rootView;
    }


    private void initGoogleMap(Bundle savedInstanceState) {
        // *** IMPORTANT ***
        // MapView requires that the Bundle you pass contain _ONLY_ MapView SDK
        // objects or sub-Bundles.
        Bundle mapViewBundle = null;
        if (savedInstanceState != null) {
            mapViewBundle = savedInstanceState.getBundle(MAPVIEW_BUNDLE_KEY);
        }

        mMapView.onCreate(mapViewBundle);
        mMapView.onResume();
//        mMapView.getMapAsync(MapFragment.this);

    }


    private void setPosition(Location location){
        List<Address> addresses;
        MarkerOptions markerOptions = new MarkerOptions();
        double latitude = location.getLatitude();
        double longitude = location.getLongitude();
        LatLng latLng = new LatLng(latitude, longitude);
        try {
            addresses = geocoder.getFromLocation(latitude, longitude, 2);
            markerOptions.position(latLng);
            markerOptions.title(addresses.get(0).getAddressLine(0));
            if (marker != null) {
                marker.remove();
//                zoom = mMap.getCameraPosition().zoom;
            }
            marker = mMap.addMarker(markerOptions);
            mMap.moveCamera(CameraUpdateFactory.newLatLng(latLng));
            mMap.animateCamera(CameraUpdateFactory.zoomTo(zoom), new GoogleMap.CancelableCallback() {
                @Override
                public void onFinish() {
                    progressBar.setVisibility(View.GONE);
                }

                @Override
                public void onCancel() {
                    progressBar.setVisibility(View.GONE);
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    @Override
    public void onMapReady(final GoogleMap googleMap) {
        Log.e(TAG, "onMapReady: called" );
        mMap = googleMap;

        googleMap.setMyLocationEnabled(true);
        googleMap.getUiSettings().setZoomControlsEnabled(true);
        googleMap.getUiSettings().setMyLocationButtonEnabled(true);

        locationCallback = new LocationCallback() {
            @Override
            public void onLocationResult(LocationResult locationResult) {
                super.onLocationResult(locationResult);
                lastLocation = locationResult.getLastLocation();
                setPosition(lastLocation);
                Log.e(TAG, "onLocationResult: " + lastLocation);

            }
        };
//            setPosition(lastLocation);
        deviceLocation.getLocationUpdates(locationCallback);

        mMap.setOnMyLocationButtonClickListener(new GoogleMap.OnMyLocationButtonClickListener() {
            @Override
            public boolean onMyLocationButtonClick() {
                if (searchBar.isSuggestionsVisible())
                    searchBar.clearSuggestions();
                if (searchBar.isSuggestionsEnabled())
                    searchBar.hideSuggestionsList();
                return false;
            }
        });

        searchBar.getMenu().setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case R.id.map_road:
                        if (mMap != null)
                            mMap.setMapType(GoogleMap.MAP_TYPE_NORMAL);
                        return true;

                    case R.id.map_satellite:
                        if (mMap != null)
                            mMap.setMapType(GoogleMap.MAP_TYPE_SATELLITE);
                            Log.d(TAG, "onOptionsItemSelected: called");
                        return true;

                    case R.id.map_hybrid:
                        if (mMap != null)
                            mMap.setMapType(GoogleMap.MAP_TYPE_HYBRID);
                        return true;

                    case R.id.map_terrain:
                        if (mMap != null)
                            mMap.setMapType(GoogleMap.MAP_TYPE_TERRAIN);
                        return true;
                    default:
                        return false;
                }
            }
        });


    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);

        Bundle mapViewBundle = outState.getBundle(MAPVIEW_BUNDLE_KEY);
        if (mapViewBundle == null) {
            mapViewBundle = new Bundle();
            outState.putBundle(MAPVIEW_BUNDLE_KEY, mapViewBundle);
        }

        mMapView.onSaveInstanceState(mapViewBundle);
    }


    @Override
    public void onResume() {
        super.onResume();
        Log.e(TAG, "onResume: called" );
        ((AppCompatActivity) getActivity()).getSupportActionBar().hide();
        mMapView.onResume();

        if (locationCallback!=null)
        deviceLocation.getLocationUpdates(locationCallback);

        getView().setFocusableInTouchMode(true);
        getView().requestFocus();
        getView().setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {

                if (event.getAction() == KeyEvent.ACTION_UP && keyCode == KeyEvent.KEYCODE_BACK) {

                    Log.d(TAG, "onKey: back btn pressed");
                    if (drawer.isDrawerOpen(GravityCompat.START))
                        drawer.closeDrawer(GravityCompat.START);
                    else
                        getActivity().onBackPressed();

                    return true;

                }

                return false;
            }
        });
    }

    @Override
    public void onStart() {
        super.onStart();
        mMapView.onStart();
    }

    @Override
    public void onStop() {
        super.onStop();
        mMapView.onStop();
        ((AppCompatActivity) getActivity()).getSupportActionBar().show();
        if (locationCallback != null)
            deviceLocation.stopLocationUpdate(locationCallback);
    }

    @Override
    public void onPause() {
        super.onPause();
        if (locationCallback != null)
            deviceLocation.stopLocationUpdate(locationCallback);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        mMapView.onDestroy();
        if (locationCallback != null)
            deviceLocation.stopLocationUpdate(locationCallback);
    }


    @Override
    public void onSearchStateChanged(boolean enabled) {
        if (locationCallback != null)
            deviceLocation.stopLocationUpdate(locationCallback);
    }

    @Override
    public void onSearchConfirmed(CharSequence text) {

        getActivity().startSearch(text.toString(), true, null, true);
    }

    @Override
    public void onButtonClicked(int buttonCode) {
        switch (buttonCode) {
            case MaterialSearchBar.BUTTON_NAVIGATION:
                drawer.openDrawer(GravityCompat.START);
                break;
            case MaterialSearchBar.BUTTON_SPEECH:
                break;
            case MaterialSearchBar.BUTTON_BACK:
                searchBar.closeSearch();
                searchBar.clearSuggestions();
                if (locationCallback!=null)
                deviceLocation.getLocationUpdates(locationCallback);
                break;
        }
    }
}
