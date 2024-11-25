import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/providers/agency_provider.dart';
import 'logic/providers/category_provider.dart';
import 'logic/providers/module_provider.dart';
import 'logic/providers/setting_provider.dart';
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
      ChangeNotifierProvider(
        create: (_) => ModuleProvider(),
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
          seedColor: settingProvider.color,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: settingProvider.color,
        ),
      ),
      themeMode: settingProvider.darkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
