import 'package:agro_info/app/common/enums/app_route_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3A4D37),
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash_animation.json',
          repeat: true,
          width: 230,
          fit: BoxFit.contain,
          alignment: AlignmentGeometry.center,
          onLoaded: (composition) {
            FlutterNativeSplash.remove();
            Future.delayed(composition.duration, () {
              if (mounted) {
                Navigator.of(context).pushReplacementNamed(AppRouteEnum.plague.name);
              }
            });
          },
        ),
      ),
    );
  }
}
