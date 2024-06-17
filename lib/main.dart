import 'dart:io';
import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:ekram_project_dashboardadmin/views/screens/mainScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb || Platform.isAndroid? FirebaseOptions(
      apiKey: "AIzaSyBppTe5E7X-0q_-bZscMmrF2h4bh52uBwU", 
      appId: "1:884494493591:web:a592f27755f74fe9f146d2", 
      messagingSenderId: "884494493591", 
      projectId: "clinic-project-17f49",
      storageBucket: "clinic-project-17f49.appspot.com",
      ):null,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          elevation: MaterialStateProperty.all(6),
          textStyle: MaterialStateProperty.resolveWith((states) => 
          TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),),)),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor:WidgetStateProperty.all(AppColors.primaryColor),
          elevation: WidgetStateProperty.all(6),
        )
      )
      ),
      home: MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}

