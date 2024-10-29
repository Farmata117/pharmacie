import 'package:flutter/material.dart';
import 'package:pharmacie/screens/home.dart';
import 'package:pharmacie/screens/admin_home_page.dart'; 
import 'package:pharmacie/constant.dart';
import 'package:pharmacie/models/api_response.dart';
import 'package:pharmacie/services/user_service.dart';
import 'package:pharmacie/screens/login.dart';
import '../models/user.dart'; 

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    _loadUserInfo(); // Appelle la méthode de chargement des infos utilisateur
  }

  void _loadUserInfo() async {
    String token = await getToken(); // Récupère le token d'authentification

    if (token.isEmpty) {
      // Si le token est vide, redirige vers la page de connexion
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    } else {
      // Si le token existe, récupère les détails de l'utilisateur
      ApiResponse response = await getUserDetail();
      if (response.error == null) {
        User user = response.data as User; 
        if (user.role == 'admin') {
          // Si l'utilisateur est un administrateur, redirige vers la page d'accueil admin
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AdminHomePage()), (route) => true);
        } else {
          // Sinon, redirige vers la page d'accueil normale
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home()), (route) => true);
        }
      } else if (response.error == unauthorized) {
        // Si l'erreur est d'autorisation, redirige vers la page de connexion
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login()), (route) => true);
      } else {
        // Affiche un message d'erreur
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.error ?? somethingwentwrong),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
