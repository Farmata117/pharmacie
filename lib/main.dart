import 'package:flutter/material.dart';
import 'Screens/loading.dart'; // Votre page de chargement
import 'Screens/home.dart'; // Importer la page Home
import 'Screens/admin.dart'; // Importer la page Admin
import 'Screens/search.dart'; // Importer la page Search
import 'Screens/Qrscanner.dart'; // Importer la page Scanner
import 'Screens/ajouter.dart'; // Importer la page Ajouter
import 'Screens/modifier.dart'; // Importer la page Modifier
import 'Screens/supprimer.dart'; // Importer la page Supprimer


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Définir la route initiale
      routes: {
        '/': (context) => Loading(), // Route pour la page de chargement
        '/home': (context) => Home(), // Route pour Home
        '/admin': (context) => Admin(), // Route pour Admin
        '/search': (context) => Search(), // Route pour Search
        '/scanner': (context) => QrScanner(), // Route pour Scanner
        '/ajouter': (context) => Ajouter(), // Route pour Ajouter
        '/modifier': (context) => Modifier(), // Route pour Modifier
        '/supprimer': (context) => Supprimer(), // Route pour Supprimer
      },
    );
  }
}

// loginRegisterHint

Row KLoginRegister(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Vous n'avez pas de compte?"),
      GestureDetector(
        child: Text(label, style: TextStyle(color: Colors.green)),
        onTap: () => onTap(),
      ),
    ],
  );
}
