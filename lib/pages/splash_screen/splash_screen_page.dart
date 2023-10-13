import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.deepPurple, Colors.black],
                stops: [0.35, 0.7])),
        child: Center(
          child: AnimatedTextKit(
            repeatForever: false,
            totalRepeatCount: 1,
            animatedTexts: [
              RotateAnimatedText('Meu App',
                  duration: const Duration(milliseconds: 1500),
                  textStyle:
                      const TextStyle(fontSize: 40, color: Colors.white)),
              RotateAnimatedText('de aprendizado',
                  duration: const Duration(milliseconds: 1500),
                  textStyle:
                      const TextStyle(fontSize: 40, color: Colors.white)),
              RotateAnimatedText('em Flutter',
                  duration: const Duration(milliseconds: 1500),
                  textStyle:
                      const TextStyle(fontSize: 40, color: Colors.white)),
            ],
            onFinished: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) => const LoginPage()));
            },
          ),
        ),
      ),
    );
  }
}
