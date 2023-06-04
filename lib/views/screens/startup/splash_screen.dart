import 'package:dog/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constants/shared_preference_constant.dart';
import '../../../services/navigation_service.dart';
import '../../styles/b_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/home_screen.dart';
import 'intro_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // initData();
  }

  initData() async {
    bool isNewlyInstalled = getBoolAsync(NEWLY_INSTALLED, defaultValue: true);
    //ref.read(initDataProvider.notifier).fetchData();

    if (isNewlyInstalled) {
      setValue(NEWLY_INSTALLED, false);
      await Future.delayed(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
                context,
                FadeRoute(page: IntroScreen()),
              ));
    }
    if (!mounted) return;
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(context, FadeRoute(page: HomeScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.primary,
      body: Container(
        // color: Colors.white,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetPath.splashScreen,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
