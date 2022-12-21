import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../constants/app_constant.dart';
import '../helpers/directions_handler.dart';
import '../helpers/shared_prefs.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Mapbox related
  int selectedIndex = 0;
  PageController pageController = PageController();

  LatLng latLng = getLatLngFromSharedPrefs();
LatLng dest=LatLng(0, 0);
late CameraPosition _initialCameraPosition;
late MapboxMapController controller;
bool lined=false;




  // Carousel related

  @override
  void initState() {
    super.initState();
    _initialCameraPosition =CameraPosition(target: latLng,zoom: 17);


   // num distance =getDistanceFromSharedPrefs()/1000;
   // num duration =getDurationFromSharedPrefs()/60;

  }

  _addSourceAndLineLayer(int index, bool removeLayer) async {

    // Add a polyLine between source and destination
Map geometry = getGeometryFromSharedPrefs();
final _lines = {
  "type": "FeatureCollection",
  "features":[
    {
      "type":"Feature",
      "id":0,
      "properties":<String,dynamic>{},
      "geometry":geometry,
    }
  ]
};
    // Remove lineLayer and source if it exists
if(removeLayer==true){
  lined=false;
  await controller.removeLayer("lines");
  await controller.removeSource("fills");

}
    // Add new source and lineLayer
lined=true;
    await controller.addSource("fills", GeojsonSourceProperties(data: _lines));
await controller.addLineLayer("fills", "lines", LineLayerProperties(
  lineColor: Colors.green.toHexStringRGB(),
  lineCap: "round",
  lineJoin: "round",
  lineWidth: 3
));
  }

  _onMapCreated(MapboxMapController controller) async {
    this.controller=controller;

  }

  _onStyleLoadedCallback() async {

  }


  _addMarker(LatLng coordinates) async{
    dest=coordinates;
    setState(()  {
      print(coordinates);
      if (controller.symbols.isNotEmpty) {
        controller.removeSymbol(controller.symbols.last);
        if(lined==true){
           controller.removeLayer("lines");
           controller.removeSource("fills");
        }
      }else{
        controller.addSymbol(
            SymbolOptions(
                geometry: coordinates,
                iconImage: 'assets/image/marker.png',
                iconSize: 0.2,
                zIndex: 5000
            ),

        );

    }}
    );
  }
  _DIRECTIONFINDER(LatLng currentLatLng, LatLng destination) async {
    Map modifiedResponse = await getDirectionsAPIResponse(currentLatLng,destination);
    saveDirectionsAPIResponse(1, json.encode(modifiedResponse));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Map'),

            GestureDetector(
              onTap: (){
                controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
              },
              child: CircleAvatar(
                child:Icon( CupertinoIcons.map_pin_ellipse),
              ),
            ),
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
              },
              child: CircleAvatar(
                child: Icon(FontAwesomeIcons.arrowRightFromBracket),
              ),
            )
          ],
        )

      ),
      body:  SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Stack(
                children: [
                  MapboxMap(

                      initialCameraPosition: _initialCameraPosition,
                      accessToken: AppConstant.MAPBOX_ACCESS_TOKEN,
                     onMapCreated: _onMapCreated,
                    onStyleLoadedCallback: _onStyleLoadedCallback,
                    myLocationEnabled: true,
                    myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                    minMaxZoomPreference: MinMaxZoomPreference(14,30),
                    onMapLongClick: (point, coordinates) {
                   _addMarker(coordinates);
                   _DIRECTIONFINDER(latLng, coordinates);
                    },

                  ),
                ],
              ),
            )
          ],
        ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addSourceAndLineLayer(0, true);

        },
        child: CircleAvatar(
          child: Icon(Icons.directions),
        ),
      ),

      );

  }
}
