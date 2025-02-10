import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/features/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  late settingsProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of(context, listen: false);
    provider.getLocation();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Consumer<settingsProvider>(
      builder: (context,value,child) =>Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                onTap: (location){
                  provider.changeLocation(location);
                  Navigator.pop(context);
                },
                initialCameraPosition: provider.cameraPosition,
          ///mapType feature here
          mapType: MapType.normal,
          onMapCreated: (mapController){
            provider.mapController = mapController;
          },
          markers: provider.markers,
        ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                 color: AppColors.purple
              ),
              child:Text("tap to select location",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.white
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
