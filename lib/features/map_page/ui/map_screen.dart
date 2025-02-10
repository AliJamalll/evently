import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/features/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
   const MapScreen({super.key});
   
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  late settingsProvider settingProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingProvider = Provider.of(context,listen: false);///there will happen a crash if you didn't put listen = false because you are calling the provider
    ///and it depends on context doesn't created yet
    settingProvider.getLocation();
  //  settingProvider.setLocationListener();
  }

  @override
  Widget build(BuildContext context) {
    settingProvider = Provider.of(context);
    return Consumer<settingsProvider>(
        builder: (context,provider,child) =>Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: FloatingActionButton(
              onPressed: (){
                provider.getLocation();
              },
            backgroundColor: AppColors.purple,
              child: Icon(Icons.gps_fixed,color: AppColors.white,),
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(child:
              GoogleMap(initialCameraPosition: provider.cameraPosition,
              ///mapType feature here
                mapType: MapType.normal,
              onMapCreated: (mapController){
                provider.mapController = mapController;
              },
                markers: provider.markers,
              ),
              ),
            ],
          )
    )
    );
  }
}
