import 'package:dog/views/screens/startup/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'controller/logger/logger_controller.dart';
import 'services/navigation_service.dart';
import 'views/screens/startup/splash_screen.dart';
import 'views/styles/b_style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  // NotificationService().firebaseInitialization();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(ProviderScope(observers: [Logger()], child: MyApp()));
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: KColor.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: "The Dog Care",
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme( builders:{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        textTheme: Typography.material2018().black,
        backgroundColor: KColor.white,
        scaffoldBackgroundColor: KColor.white,
        fontFamily: GoogleFonts.montserrat().toString(),
      ),
      home: const IntroScreen(),
    );
  }
}
