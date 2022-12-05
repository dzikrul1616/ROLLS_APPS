import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rolls_apps/app/provider/google_sign_in.dart';
import 'package:rolls_apps/app/widgets/splash.dart';
import 'app/routes/app_pages.dart';
import 'app/widgets/splash.dart';

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 0)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            } else {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "ROLLS",
                initialRoute: Routes.EDIT_PROFIL,
                getPages: AppPages.routes,
              );
            }
          }));
}
