import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pharmacie/qr_resultat.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool isFlashOn = false;
  bool isFrontCamera = false;
  bool isScannerCompleted = false; // Ajouter l'état du scanner

  void closeScreen() {
    setState(() {
      isScannerCompleted = false; // Réinitialiser le scanner après la fermeture
    });
    Navigator.pop(context); // Fermer la page QRResultat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Retourne à la page précédente
          },
          icon: Icon(Icons.arrow_back), // Icône de flèche retour
          iconSize: 30,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "Qr_Scanner",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFlashOn = !isFlashOn;
              });
            },
            icon: Icon(Icons.flash_on,
                color: isFlashOn ? Colors.white : Colors.black),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFrontCamera = !isFrontCamera;
              });
            },
            icon: Icon(Icons.flip_camera_android,
                color: isFrontCamera ? Colors.white : Colors.black),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR code in designated area",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Let the scan do the magic - It starts on its own",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  MobileScanner(
                    onDetect: (barcode, args) {
                      if (!isScannerCompleted) {
                        isScannerCompleted = true;
                        String code = barcode.rawValue ?? "---";
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return QRResultat(
                              code: code,
                              closeScreen: closeScreen, // Passer la fonction closeScreen
                            );
                          },
                        ));
                      }
                    },
                  ),
                  QRScannerOverlay(
                    overlayColor: Colors.black26,
                    borderColor: Colors.green,
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
