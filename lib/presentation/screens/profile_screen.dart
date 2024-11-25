import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:voygo/logic/providers/module_provider.dart';
import 'package:voygo/presentation/widgets/colors_widget.dart';
import 'package:voygo/presentation/widgets/module_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ModuleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 38,
                    child: Text(
                      'IV',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'APSTI-IESTP-JMA',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text('HDSII y AD&S 2024-II'),
                      const SizedBox(height: 8.0),
                      const ColorsWidget(),
                    ],
                  ),
                ],
              ),
            ),
            ...List.generate(
              provider.modules.length,
              (index) {
                final module = provider.modules[index];
                print('INDIVIDUAL');
                print(module);
                return ModuleWidget(
                  id: module.id,
                  name: module.name,
                  iconName: module.icon,
                  state: module.state,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Ajustes'),
              onTap: () => context.go('/setting'),
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Cerrar Sesión'),
              onTap: () => context.go('/welcome'),
            ),
          ],
        ),
      ),
    );
  }
}
