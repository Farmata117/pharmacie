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

    ApiResponse response = await register(nameController.text, emailController.text, passwordController.text);
    
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
        title: Text('Inscrire'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          children: [
            TextFormField(
              controller: nameController,
              validator: (val) => val!.isEmpty ? 'Nom invalide' : null,
              decoration: KInputDecoration('Nom'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              validator: (val) => val!.isEmpty ? 'Adresse email invalide' : null,
              decoration: KInputDecoration('Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (val) =>
                  val!.length < 6 ? 'Au moins 6 caractères requis' : null,
              decoration: KInputDecoration('Mot de passe'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordConfirmController,
              obscureText: true,
              validator: (val) {
                if (val != passwordController.text) {
                  return 'La confirmation du mot de passe ne correspond pas';
                }
                return null;
              },
              decoration: KInputDecoration('Confirmation du mot de passe'),
            ),
            SizedBox(
              height: 20,
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : KTextButton('Inscrire', () {
                    if (formkey.currentState!.validate()) {
                      _RegisterUser();
                    }
                  }),
            SizedBox(
              height: 10,
            ),
            KLoginRegister(
                "Vous avez déjà un compte sur cette plateforme ?", 'Se connecter',
                () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
