import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase/firebase_options.dart';
import 'src/core/app_themes.dart';
import 'src/routes/app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Budget",
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}

