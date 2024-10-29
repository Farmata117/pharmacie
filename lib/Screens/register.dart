import 'package:flutter/material.dart';
import 'package:pharmacie/Screens/home.dart';
import 'package:pharmacie/models/api_response.dart';
import 'package:pharmacie/models/user.dart';
import 'package:pharmacie/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void _RegisterUser() async {
    setState(() {
      loading = true;
    });

    ApiResponse response = await register(
        nameController.text, emailController.text, passwordController.text);

    setState(() {
      loading = false;
    });

    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  // Save and redirect to home
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscrire', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green, // Couleur de l'AppBar en vert
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              validator: (val) => val!.isEmpty ? 'Nom invalide' : null,
              decoration: _inputDecoration('Nom'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              validator: (val) =>
                  val!.isEmpty ? 'Adresse email invalide' : null,
              decoration: _inputDecoration('Email'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (val) =>
                  val!.length < 6 ? 'Au moins 6 caractères requis' : null,
              decoration: _inputDecoration('Mot de passe'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordConfirmController,
              obscureText: true,
              validator: (val) {
                if (val != passwordController.text) {
                  return 'La confirmation du mot de passe ne correspond pas';
                }
                return null;
              },
              decoration: _inputDecoration('Confirmation du mot de passe'),
            ),
            SizedBox(height: 20),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        _RegisterUser();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Couleur verte pour le bouton
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: Text(
                      'Inscrire',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
            SizedBox(height: 10),
            KLoginRegister("Vous avez déjà un compte sur cette plateforme ?",
                'Se connecter', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.green), // Couleur verte pour le label
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
    );
  }
}
