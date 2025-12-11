import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ... (PrivacyPolicyScreen, main, TaxiApp, LocationPermissionScreen sınıfları aynı kalacak) ...

// Ana Harita Ekranımız (İzin verildikten sonra buraya gelinecek)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Haritanın başlangıç konumu için bir koordinat belirleyelim (Örnek: Oslo)
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(59.9139, 10.7522), // Stavanger Merkez
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bilge TAXI')),
      body: const GoogleMap(
        // HARİTA WIDGET'INI BURAYA EKLEDİK
        initialCameraPosition: _kInitialPosition,
        mapType: MapType.normal,
        myLocationEnabled: true, // Kullanıcının mavi noktasını gösterir
        // Diğer ayarları buraya ekleyebilirsiniz (markers, polylines vb.)
      ),
    );
  }
}
