import 'package:chatb/Bloc/AuthCubitState.dart';
import 'package:chatb/Pages/HomePage.dart';
import 'package:chatb/Pages/SignUpPage.dart';
import 'package:chatb/Services/AuthServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
              authService: AuthServices(
            firebaseAuth: FirebaseAuth.instance,
          )),
        ),
      ],
      child: MaterialApp(
        title: 'ChatB',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return SignUpPage();
            }
          },
        ),
      ),
    );
  }
}
