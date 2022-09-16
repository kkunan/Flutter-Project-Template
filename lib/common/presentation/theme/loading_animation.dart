import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/animations/loading.json');
  }
}