import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ajouter extends StatefulWidget {
  @override
  _AjouterState createState() => _AjouterState();
}

class _AjouterState extends State<Ajouter> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fabricantController = TextEditingController();
  final TextEditingController _dateExpirationController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isLoading = false;

  Future<void> ajouterMedicament() async {
    setState(() {
      _isLoading = true;
    });

    final Map<String, dynamic> drugData = {
      'nom': _nameController.text,
      'fabricant': _fabricantController.text,
      'date_expiration': _dateExpirationController.text,
      'description': _descriptionController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/medicaments/create'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(drugData),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Médicament ajouté avec succès !')),
        );
        _nameController.clear();
        _fabricantController.clear();
        _dateExpirationController.clear();
        _descriptionController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Échec de l\'ajout du médicament.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Médicament',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green, // Couleur de l'AppBar en vert
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Veuillez remplir les informations suivantes :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              _buildTextField(_nameController, 'Nom du médicament'),
              SizedBox(height: 20),
              _buildTextField(_fabricantController, 'Fabricant'),
              SizedBox(height: 20),
              _buildTextField(
                  _dateExpirationController, 'Date d\'expiration (YYYY-MM-DD)'),
              SizedBox(height: 20),
              _buildTextField(_descriptionController, 'Description'),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () => ajouterMedicament(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Arrière-plan vert pour le bouton
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text('Ajouter', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            TextStyle(color: Colors.green), // Couleur verte pour le label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Colors.green), // Couleur verte pour le contour
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Colors.green), // Couleur verte pour le contour
        ),
      ),
      style: TextStyle(color: Colors.green), // Couleur verte pour le texte
    );
  }
}
