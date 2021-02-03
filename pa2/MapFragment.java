package me.ictlinkbd.com.projectalpha.map;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;

import androidx.appcompat.widget.SearchView;
import androidx.fragment.app.Fragment;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import me.ictlinkbd.com.projectalpha.R;
import me.ictlinkbd.com.projectalpha.util.DeviceLocation;


public class MapFragment extends Fragment {


    private MapView mMapView;
    private GoogleMap googleMap;
    private List<Address> addressList;
    private SwipeRefreshLayout swipeRefreshLayout;
    private Location lastLocation;
    private Geocoder geocoder;
    private Context context;
    private DeviceLocation deviceLocation;
    private LocationCallback locationCallback;
    private String TAG = "MapFragment ";

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
        setHasOptionsMenu(true);
        View rootView = inflater.inflate(R.layout.fragment_map, container, false);
        Log.e(TAG, "onCreateView: called");
        mMapView = rootView.findViewById(R.id.mapView);
        swipeRefreshLayout = rootView.findViewById(R.id.swipe_container);
        addressList = new ArrayList<>();
        mMapView.onCreate(savedInstanceState);
        mMapView.onResume(); // needed to get the map to display immediately

        locationCallback = new LocationCallback() {
            @Override
            public void onLocationResult(LocationResult locationResult) {
                super.onLocationResult(locationResult);
                lastLocation = locationResult.getLastLocation();
                Log.e(TAG, "onLocationResult: " + lastLocation);
                mapPosition(lastLocation);
                deviceLocation.stopLocationUpdate(locationCallback);
            }
        };

        deviceLocation.getLocationUpdates(locationCallback);
        swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                refresh(lastLocation);
            }
        });

        return rootView;
    }

    private void refresh(final Location location) {
        swipeRefreshLayout.setRefreshing(true);

        //refresh long-time task in background thread
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    //dummy delay for 2 second
                    Thread.sleep(200);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                //update ui on UI thread
                (getActivity()).runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        mapPosition(location);
                        swipeRefreshLayout.setRefreshing(false);
                    }
                });

            }
        }).start();
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
//        menu.clear();
        inflater.inflate(R.menu.map_menu, menu);
        MenuItem searchItem = menu.findItem(R.id.search_map);
        final SearchView searchView = (SearchView) searchItem.getActionView();
        searchView.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
//        searchView.setSearchableInfo(searchManager.getSearchableInfo(getComponentName()));
        searchView.setSubmitButtonEnabled(true);
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                searchView.clearFocus();
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                if (!newText.equals("")) {
                    try {
                        addressList = geocoder.getFromLocationName(newText, 1);
                        if (addressList != null) {
                            for (int i = 0; i < addressList.size(); i++) {
                                Location searchedLocation = new Location(LocationManager.GPS_PROVIDER);
                                searchedLocation.setLatitude(addressList.get(i).getLatitude());
                                searchedLocation.setLongitude(addressList.get(i).getLongitude());
                                mapPosition(searchedLocation);
                            }
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                return true;
            }
        });
    }

    @Override
    public void onResume() {
        super.onResume();
        mMapView.onResume();

    }


    @Override
    public void onPause() {
        super.onPause();
        if (locationCallback != null)
            deviceLocation.stopLocationUpdate(locationCallback);
        mMapView.onPause();
    }

    @Override
    public void onDestroy() {
        if (locationCallback != null)
            deviceLocation.stopLocationUpdate(locationCallback);
        mMapView.onDestroy();
        super.onDestroy();
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();
        mMapView.onLowMemory();
    }

    public void mapPosition(final Location location) {
        Log.d(TAG, "mapPosition: called"+location.getLatitude()+" "+location.getLongitude());
        mMapView.getMapAsync(new OnMapReadyCallback() {
            @Override
            public void onMapReady(GoogleMap mMap) {
                googleMap = mMap;
                googleMap.setMyLocationEnabled(true);
                List<Address> addresses;
                MarkerOptions markerOptions = new MarkerOptions();
                double latitude = location.getLatitude();
                double longitude = location.getLongitude();
                LatLng latLng = new LatLng(latitude, longitude);
                try {
                    addresses = geocoder.getFromLocation(latitude, longitude, 2);
                    markerOptions.position(latLng);
                    markerOptions.title(addresses.get(0).getAddressLine(0));
                    googleMap.addMarker(markerOptions);
                    googleMap.moveCamera(CameraUpdateFactory.newLatLng(latLng));
                    googleMap.animateCamera(CameraUpdateFactory.zoomTo(15.5f));
                    googleMap.getUiSettings().setZoomControlsEnabled(true);
                } catch (IOException e) {
                    e.printStackTrace();
                }


//                googleMap.addMarker(new MarkerOptions().position(latLng).title("Marker Title").snippet("Marker Description"));
//
//                // For zooming automatically to the location of the marker
//                CameraPosition cameraPosition = new CameraPosition.Builder().target(latLng).zoom(15.5f).build();
//                googleMap.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition));


            }
        });
    }

}
