import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper{
  Future<Map<String,dynamic>?> getUserLocation()async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return null;
    }

    permission = await Geolocator.checkPermission();
    if(permission  == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return null;  
      }
    }

    if(permission == LocationPermission.deniedForever){
      return null;
    }

    try{
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );

      List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

      if(placemark.isNotEmpty){
        Placemark place = placemark[0];

        return{
          'city':place.locality ?? 'unknown',
          'country':place.country ?? 'unknown',
          'latitude':position.latitude,
          'longitude':position.longitude,
          'address': '${place.street}, ${place.locality}, ${place.country}'
        };
      }
    }catch(e){
      print('Error getting location : $e');
    }
    return null;
  }
}