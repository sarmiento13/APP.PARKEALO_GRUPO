import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/providers/setting_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

    return AnnotatedRegion(
      value: settingProvider.darkMode
          ? SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Theme.of(context).colorScheme.surfaceContainer,
              systemNavigationBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Theme.of(context).colorScheme.surfaceContainer,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Preferencias',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SwitchListTile(
              value: settingProvider.notifications,
              onChanged: (value) => settingProvider.toogleNotifications(value),
              secondary: const Icon(Icons.notifications_outlined),
              title: const Text('Notificaciones'),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Idioma'),
              trailing: Text('Español'),
            ),
            SwitchListTile(
              value: settingProvider.darkMode,
              onChanged: (value) => settingProvider.toogleDarkMode(value),
              secondary: const Icon(Icons.dark_mode_outlined),
              title: const Text('Modo oscuro'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'Ayuda',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_support_outlined),
              title: Text('Preguntas frecuentes'),
              onTap: () => context.go('/setting/faqs'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Acerca de'),
              onTap: () => context.go('/setting/about'),
            ),
          ],
        ),
      ),
    );
  }
}
