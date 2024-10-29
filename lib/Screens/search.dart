import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> medicaments = [
    'Paracétamol',
    'Ibuprofène',
    'Aspirine',
    'Amoxicilline',
    'Cétirizine',
    // Ajoutez d'autres médicaments ici
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recherche un médicament',
          style: TextStyle(color: Colors.green), // Titre en vert
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white, // Fond de la barre d'application blanc
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher un médicament',
                labelStyle: TextStyle(color: Colors.green), // Label en vert
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.green), // Bordure verte
                ),
              ),
              style: TextStyle(color: Colors.green), // Texte en blanc
              onChanged: (value) {
                setState(() {
                  query = value; // Met à jour la requête de recherche
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour la recherche ici
                // Vous pouvez ajouter des actions supplémentaires si nécessaire
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Couleur verte pour le bouton
              ),
              child: Text(
                'Rechercher',
                style: TextStyle(color: Colors.white), // Texte en blanc
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: medicaments
                    .where((medicament) => medicament.toLowerCase().contains(
                        query.toLowerCase())) // Filtre les médicaments
                    .length, // Utilisez le nombre de médicaments filtrés
                itemBuilder: (context, index) {
                  // Filtrer la liste en fonction de la requête
                  final filteredMedicaments = medicaments
                      .where((medicament) => medicament
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                      .toList();

                  return ListTile(
                    title: Text(filteredMedicaments[
                        index]), // Afficher les résultats de recherche
                    onTap: () {
                      // Logique pour afficher les détails du médicament
                      // Navigator.pushNamed(context, '/drugDetail');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
        ],
        currentIndex: 1, // Index de l'onglet "Recherche"
        selectedItemColor:
            Colors.green, // Couleur verte pour l'élément sélectionné
        unselectedItemColor:
            Colors.green, // Couleur pour les éléments non sélectionnés
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(
                  context, '/home'); // Naviguer vers Accueil
              break;
            case 1:
              // Reste sur la page de recherche
              break;
            case 2:
              Navigator.pushReplacementNamed(
                  context, '/scanner'); // Naviguer vers Scanner
              break;
            case 3:
              Navigator.pushReplacementNamed(
                  context, '/admin'); // Naviguer vers Admin
              break;
          }
        },
      ),
    );
  }
}
