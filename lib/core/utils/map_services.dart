import 'package:location/location.dart';

class MapServices{

  Location location = Location();

  String locationMessage  = "";

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

}
