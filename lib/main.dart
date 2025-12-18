import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ... (PrivacyPolicyScreen, main, TaxiApp, LocationPermissionScreen sınıfları aynı kalacak) ...

// Ana Harita Ekranımız (İzin verildikten sonra buraya gelinecek)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Haritanın başlangıç konumu için bir koordinat belirleyelim (Örnek: Oslo)
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(59.9139, 10.7522), // Stavanger Merkez
    zoom: 14.0,
  );

  GoogleMapController? _mapController;
  bool _mapCreated = false;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() => _mapCreated = true);
    debugPrint('GoogleMap: onMapCreated');
    // Force a camera update (helps trigger tile requests)
    controller.animateCamera(CameraUpdate.newCameraPosition(_kInitialPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bilge TAXI')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
          ),
          if (!_mapCreated)
            const Positioned.fill(
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
