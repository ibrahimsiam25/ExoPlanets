import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:exo_planets/exo_planets_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:exo_planets/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exo_planets/core/DI/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: true),
  );
  runApp(const ExoPlanetsApp());
}
