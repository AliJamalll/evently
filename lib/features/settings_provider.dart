import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class settingsProvider extends ChangeNotifier{

  ///observer pattern
  ///singleton
  Location location = Location();

  String locationMessage  = "";


  List<String> _languages = ["English", "عربي"];
  List<String> _Themes = ["light", "Dark"];

  List<String> get languages => _languages;
  List<String> get Themes => _Themes;


  String currentLanguage = "en";
  ThemeMode currentThemeMode = ThemeMode.light;

  void setNewLanguage(String newLanguage){
    if(currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
  void setNewTheme(ThemeMode newThemeMode){
    if(currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }
  bool isDarkTheme(){
    return currentThemeMode == ThemeMode.dark;
  }

  LatLng? eventLocation;

  late GoogleMapController mapController ;
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("0"),
      position: LatLng(37.42796133580664, -122.085749655962)
    )
  };

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17,
  );

  Future<void> getLocation()async{
    locationMessage = "Checking Location Services";
    bool locationPermissionGranted = await _getLocationPermission();
    if(!locationPermissionGranted){
      locationMessage = "location Permission Dined";
      //notify
      return;
    }
    bool locationServiceEnabled = await _locationServiceEnabled();
    if(!locationServiceEnabled){
      locationMessage = "Location services Disabled";
      //notify
      return;
    }
    locationMessage = " Location Service Enabled and now we are Getting your location";
    notifyListeners();
    LocationData locationData = await location.getLocation();
    changeLocationMap(locationData);
    //locationMessage = " you are at ${locationData.latitude} : ${locationData.longitude}";
    //notifyListeners();
  }


  Future<bool> _getLocationPermission() async{

    var permissionStatus = await location.hasPermission();
    if(permissionStatus == PermissionStatus.denied){
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }


  Future<bool>_locationServiceEnabled() async{
    bool locationServiceEnabled = await location.serviceEnabled();
    if(!locationServiceEnabled){
      locationServiceEnabled = await location.requestService();
    }
    return locationServiceEnabled;
  }

  void setLocationListener(){
    location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000 //=> refresh each second
    );
    location.onLocationChanged.listen((location){
      changeLocationMap(location);
    });
  }

  void changeLocationMap(LocationData locationData){
    cameraPosition = CameraPosition(target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0
    ),
        zoom: 17
    );
    markers = {
      Marker(
          markerId: MarkerId("0"),
          position: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0)
      )
    };
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    notifyListeners();
  }

  void changeLocation(LatLng newEventLocation){
    eventLocation = newEventLocation;
    notifyListeners();
  }
}