import 'package:flutter/material.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WiFi Scanner App'),
        ),
        body: Center(
          child: Text('WiFi Scanner is running in the background.'),
        ),
      ),
    );
  }
}

class WiFiScannerService extends StatefulWidget {
  @override
  _WiFiScannerServiceState createState() => _WiFiScannerServiceState();
}

class _WiFiScannerServiceState extends State<WiFiScannerService> {
  final wifiInfo = WifiInfo();
  final List<String> allowedNetworks = ['nome_wifi_artefato1', 'nome_wifi_artefato2'];

  @override
  void initState() {
    super.initState();
    startWiFiScanning();
  }

  Future<void> startWiFiScanning() async {
    Timer.periodic(Duration(minutes: 1), (timer) async {
      final ssid = await wifiInfo.getWifiName();
      if (ssid != null && allowedNetworks.contains(ssid)) {
        // A rede Wi-Fi encontrada está na lista de redes permitidas.
        // Faça alguma ação aqui, como notificar o usuário.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
