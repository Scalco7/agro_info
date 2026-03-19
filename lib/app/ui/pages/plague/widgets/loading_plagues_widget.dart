import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPlaguesWidget extends StatelessWidget {
  const LoadingPlaguesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Lottie.asset(
          "assets/animations/inchworm_animation.json",
          fit: BoxFit.contain,
          alignment: AlignmentGeometry.center,
          repeat: true,
          width: 200,
        ),
        Text(
          "Carregando...",
          style: TextStyle(fontWeight: FontWeight(500), fontSize: 16),
        ),
      ],
    );
  }
}
