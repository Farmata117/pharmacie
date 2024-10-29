
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text(''), // Pas de titre
        centerTitle: true,
        elevation: 0, // Supprime l'ombre de l'app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo en haut du titre
            Image.asset(
              'assets/images/logo.png',
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const SizedBox(height: 16),

            // Titre accrocheur
            const Text(
              'Authentifiez vos Médicaments avec Confiance',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Sous-titre
            const Text(
              'Prévenez la vente de médicaments contrefaits en scannant les codes-barres.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Présentation du fonctionnement
            const Text(
              'Scannez le code-barres de votre médicament pour vérifier son authenticité instantanément.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Illustration avec images
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/scann.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Scannez',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/chek.jpeg',
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Vérifiez',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      // Menu de navigation en bas
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green, // Couleur de fond verte
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
        ],
        currentIndex: 0, // Index sélectionné
        selectedItemColor: Colors.green, // Couleur des icônes sélectionnées
        unselectedItemColor: Colors.green, // Couleur des icônes non sélectionnées
        onTap: (index) {
          // Gérer la navigation ici
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/scanner');
              break;
            case 3:
              Navigator.pushNamed(context, '/admin');
              break;
          }
        },
      ),

    );
  }
}







