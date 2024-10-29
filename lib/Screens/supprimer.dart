import 'package:flutter/material.dart';

class Supprimer extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Supprimer un Médicament',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'ID du Médicament',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  // Champ de saisie pour l'ID du médicament
                  TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      hintText: 'Entrer l\'ID du médicament',
                      hintStyle: TextStyle(color: Colors.green[300]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      String idInput = _idController.text;
                      if (idInput.isNotEmpty) {
                        // Ici, vous pouvez ajouter votre logique de suppression
                        // par exemple, appeler une fonction pour supprimer le médicament
                        // ou afficher un message de confirmation
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('ID du médicament à supprimer : $idInput')),
                        );
                      } else {
                        // Affichage d'un message d'erreur si le champ est vide
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Veuillez entrer un ID de médicament')),
                        );
                      }
                    },
                    child: Text(
                      'Supprimer',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
