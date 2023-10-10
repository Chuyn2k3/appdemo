// ignore_for_file: unused_import

import 'package:appdemo/home/cubit/cubit.dart';
import 'package:appdemo/services/routes.dart';
import 'package:appdemo/user/bloc/logout_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appdemo/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserDataCubit>(
          create: (BuildContext context) => UserDataCubit(),
        ),
        BlocProvider<DataLogoutBloc>(
          create: (BuildContext context) => DataLogoutBloc(),
        ),
      ],
    child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: routes,
      home:const Scaffold(body: SplashScreen()),
    );
  }
}
