import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/setting_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  void navigateTo() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

    return AnnotatedRegion(
      value: settingProvider.darkMode
          ? SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
              systemNavigationBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
      child: Scaffold(
        body: Center(
          child: Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/vendors/logotipo.png',
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
