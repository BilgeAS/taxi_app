import 'package:flutter/material.dart';
// 'package:location/location.dart'; satırı hata verebilir, çünkü paketi henüz eklemedik.

void main() {
  runApp(const TaxiApp());
}

class TaxiApp extends StatelessWidget {
  const TaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(), // Geçici olarak Home ekranına gidiyoruz
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Taxi App Anasayfa')),
      body: const Center(child: Text('Uygulama Hazır!')),
    );
  }
}
