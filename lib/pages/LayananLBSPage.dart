import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:tugas_3_mobile/utils/location_helper.dart';

class LayananLBSPage extends StatefulWidget {
  const LayananLBSPage({super.key});

  @override
  State<LayananLBSPage> createState() => _LayananLBSPageState();
}

class _LayananLBSPageState extends State<LayananLBSPage> {
  final LocationHelper _locationHelper = LocationHelper();
  String _location = 'No Data';
  bool _isLoading = true;


  Future<void> getUserLocation() async {
    setState(() => _isLoading=true );
    final locationData = await _locationHelper.getUserLocation();
    if(locationData != null){
      setState(() {
        _location = 
            'Latitude: ${locationData['latitude']}, Longitude: ${locationData['longitude']}\n'
            'City: ${locationData['city']}, Country: ${locationData['country']}\n'
            'Address: ${locationData['address']}';

        _isLoading = false;
      });
    }else{
      setState(() {
        _location = "Location si not found!!";
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lokasi Terkini Pengguna",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _location,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: getUserLocation,
              child: const Text('Refresh Location'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
