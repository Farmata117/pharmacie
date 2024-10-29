import 'package:flutter/material.dart';

class QRResultat extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const QRResultat({
    super.key,
    required this.code,
    required this.closeScreen, // Correction ici
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Résultat"),
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: closeScreen, // Fermer l'écran
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Code QR détecté :",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              code,
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: closeScreen, // Fermer l'écran avec un bouton
              child: Text("Fermer"),
            ),
          ],
        ),
      ),
    );
  }
}
