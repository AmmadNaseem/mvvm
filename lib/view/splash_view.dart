import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    super.initState();
    splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
