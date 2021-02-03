package me.ictlinkbd.com.projectalpha.nearByPlace.nearByPojo;

import java.io.Serializable;

public class NearbyPlacesData implements Serializable{

    private String placeName;
    private double latitude;
    private double longitude;
    private String placeLocation;
    private String placeId;
    private Double rating;
    private boolean isOpened;

    public NearbyPlacesData(String placeId, String placeName, double latitude, double longitude, String placeLocation, Double rating, boolean isOpened) {

        this.placeId = placeId;
        this.placeName = placeName;
        this.latitude = latitude;
        this.longitude = longitude;
        this.placeLocation = placeLocation;
        this.rating = rating;
        this.isOpened = isOpened;
    }

    public NearbyPlacesData(String placeId, String placeName, double latitude, double longitude, String placeLocation) {
        this.placeName = placeName;
        this.latitude = latitude;
        this.longitude = longitude;
        this.placeLocation = placeLocation;
        this.placeId = placeId;
//        this.rating = rating;
    }

    public boolean isOpened() {
        return isOpened;
    }

    public void setOpened(boolean opened) {
        isOpened = opened;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public String getPlaceId() {
        return placeId;
    }

    public String getPlaceName() {
        return placeName;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public String getPlaceLocation() {
        return placeLocation;
    }
}
