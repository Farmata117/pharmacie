//------STRINGS----------

import 'package:flutter/material.dart';

const baseURL = 'http://localhost:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const assignRoleURL = baseURL + '/admin/assign-role'; // Ajout de la route pour l'assignation des rôles



//------Errors

const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingwentwrong = 'Something went wrong, try again!';

// ----input decoration
InputDecoration KInputDecoration(String label) {
  return InputDecoration(
    labelText: label, // Utiliser le texte passé en paramètre
    contentPadding: EdgeInsets.all(10),
    border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
  );
}

//button
TextButton KTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(label, style: TextStyle(color: Colors.white)),
    style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.blue),
        padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(vertical: 10))),
    onPressed: () => onPressed(),
  );
}

// loginRegisterHint

Row KLoginRegister(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        child: Text(label, style:TextStyle(color: Colors.blue)),
        onTap: () => onTap()
      )
    ],
  );
}
