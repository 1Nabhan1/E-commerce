import 'package:ecommerce_beginning/presentation/splash_screen/controller/splash_controller.dart';
import 'package:ecommerce_beginning/presentation/splash_screen/splash.dart';
import 'package:ecommerce_beginning/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDNam_Mv7R4f9v2_fpiT6WosRu5ura_VD0",
          appId: "1:193486053849:android:ddfa66f91088a9be79b9c8",
          messagingSenderId: "193486053849",
          projectId: "shopping-firebase-67637"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          ),
          getPages: Apppages.List,
          home: GetBuilder<SplashController>(
            builder: (_) => const Splash(),
            init: SplashController(),
          )),
    );
  }
}
