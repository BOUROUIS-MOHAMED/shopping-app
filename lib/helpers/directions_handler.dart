import 'package:mapbox_gl/mapbox_gl.dart';

import '../main.dart';
import '../requests/mapbox_requests.dart';

Future<Map> getDirectionsAPIResponse(LatLng currentLatLng, LatLng destination) async {
  final response = await getCyclingRouteUsingMapbox(
      currentLatLng,
      destination);
  print(response);
  Map geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];
  print('-------------------${destination}-------------------');
  print(distance);
  print(duration);

   Map modifiedResponse = {
     "geometry": geometry,
     "duration": duration,
     "distance": distance,
   };

  return modifiedResponse;
}

void saveDirectionsAPIResponse(int index, String response) {
  sharedPreferences.setString('destination', response);
}

