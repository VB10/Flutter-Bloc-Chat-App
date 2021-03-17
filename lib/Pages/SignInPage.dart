import 'package:chatb/Constant/Constant.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: gradientColor(),
              ),
              child: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logo(size),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width / 8),
                        child: Column(
                          children: [
                            emailTextField(),
                            passwordTextField(),
                            loginButton(size),
                            accountCheckText()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

LinearGradient gradientColor() {
  return LinearGradient(
    colors: [
      Colors.black38,
      Colors.white10,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

Padding accountCheckText() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Don't Have An Account ?",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

SizedBox loginButton(Size size) {
  return SizedBox(
    width: size.width / 1.1,
    height: size.height / 14,
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        "SIGN IN",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Constant().purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}

Padding passwordTextField() {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 48.0,
    ),
    child: TextFormField(
      obscureText: true,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 40,
        ),
        filled: true,
        fillColor: Color.fromRGBO(93, 69, 207, 0.5),
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Padding emailTextField() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TextFormField(
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 40,
        ),
        filled: true,
        fillColor: Color.fromRGBO(93, 69, 207, 0.5),
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Container logo(Size size) {
  return Container(
    child: Image.asset(
      "lib/Assets/logo.png",
      width: size.width / 1.25,
    ),
  );
}
