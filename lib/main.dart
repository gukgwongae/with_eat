import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:with_eat/view/welcome/welcome_page.dart';
import 'package:with_eat/view/splash_page.dart';
import 'firebase_options.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FlutterNaverMap().init(clientId: '37wcvy81k4');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: homeTabTheme,
      home: SplashPage(
        imagePath: 'assets/splash.jpg', // 원하는 이미지 경로로 변경
        nextPage: WelcomePage(),
      ),
    );
  }
}
