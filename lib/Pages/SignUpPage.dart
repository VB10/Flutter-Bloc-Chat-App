import 'package:chatb/Bloc/AuthCubitState.dart';
import 'package:chatb/Constant/Constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  var tfemail = TextEditingController();
  var tfpass = TextEditingController();
  var tfname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Auth Failed",
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.red)),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthIsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is AuthInital) {
          return signUpScreen(size, context, tfname, tfemail, tfpass);
        }
        if (state is AuthIsDone) {
          print(state.cevap);
          return signUpScreen(size, context, tfname, tfemail, tfpass);
        } else {
          return signUpScreen(size, context, tfname, tfemail, tfpass);
        }
      },
    );
  }

  Widget signUpScreen(Size size, context, tfname, tfemail, tfpass) {
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
                            nameTextField(tfname),
                            emailTextField(tfemail),
                            passwordTextField(tfpass),
                            loginButton(size, context, tfname, tfemail, tfpass),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Already Have An Account ?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          "Login Now",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

SizedBox loginButton(Size size, context, tfname, tfemail, tfpass) {
  return SizedBox(
    width: size.width / 1.1,
    height: size.height / 14,
    child: ElevatedButton(
      onPressed: () {
        BlocProvider.of<AuthCubit>(context).signUpAndEmit(tfemail.text, tfpass.text, tfname.text);
      },
      child: Text(
        "SIGN UP",
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

Padding passwordTextField(tfpass) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 48.0,
    ),
    child: TextFormField(
      controller: tfpass,
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

Padding emailTextField(tfemail) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TextFormField(
      controller: tfemail,
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

Padding nameTextField(tfname) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TextFormField(
      controller: tfname,
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
        labelText: "Username",
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
