import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voygo/logic/providers/agency_provider.dart';
import 'package:voygo/logic/providers/category_provider.dart';
import 'package:voygo/logic/providers/setting_provider.dart';

import 'navigation/navigation_service.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SettingProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => AgencyProvider(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.blue.shade900,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.blue.shade900,
        ),
      ),
      themeMode: settingProvider.darkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
