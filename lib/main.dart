import 'package:flutter/material.dart';
import 'package:location/location.dart'; // Bu satır artık çalışacak

// lib/main.dart dosyasının en altına ekleyin

class PrivacyPolicyScreen extends StatelessWidget {
  final VoidCallback onAccepted;

  const PrivacyPolicyScreen({Key? key, required this.onAccepted})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personvernerklæring'), // Norveççe başlık
        automaticallyImplyLeading: false, // Geri butonu olmasın
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                // BURAYA FİRMANIN UZUN METNİNİ KOYUN
                child: Text(
                  'Buraya firmanızın tüm gizlilik politikası metni gelecek. '
                  'Hangi verilerin toplandığı, nasıl kullanıldığı, KVKK/GDPR '
                  'uyumluluğu vb. Bu metin, müşterinin okuması gereken resmi metindir. '
                  'Metni uzatın ki ekranı doldursun ve kullanıcı kaydırmak zorunda kalsın.',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  onAccepted, // Tıklandığında ana ekrana/izin ekranına gidecek
              child: const Text('Godta og Fortsett'),
            ),
          ],
        ),
      ),
    );
  }
}

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
      home: const LocationPermissionScreen(), // İzin ekranıyla başlıyoruz
    );
  }
}

// İzin Ekranımız
class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  final Location location = Location();
  String _statusMessage = 'Konum izni bekleniyor...';

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        setState(() => _statusMessage = 'Konum servisleri kapalı.');
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        setState(() => _statusMessage = 'Konum izni reddedildi.');
        return;
      }
    }

    // Her şey tamamsa harita ekranına git
    _navigateToHomeScreen();
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gizlilik Onayı')),
      body: Center(child: Text(_statusMessage, textAlign: TextAlign.center)),
    );
  }
}

// Ana Harita Ekranımız (İzin verildikten sonra buraya gelinecek)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Taxi App Harita')),
      body: const Center(child: Text('GOOGLE HARİTA BURADA AÇILACAK!')),
    );
  }
}
