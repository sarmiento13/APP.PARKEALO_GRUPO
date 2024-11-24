import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voygo/data/database/data.dart';
import 'package:voygo/presentation/widgets/module_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const CircleAvatar(
                    maxRadius: 38,
                    backgroundImage: NetworkImage(
                        'https://yt3.ggpht.com/ETiaDmhpKitYqlNIVKCEvE-qgA5rU9WIOpRHxxYA7HRFmhrVohxbPCSPLAr8-C0bRvX4ZVBzuD4=s88-c-k-c0x00ffffff-no-rj'),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Insanegaz',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text('insanegaz@gmail.com'),
                      const SizedBox(height: 8.0),
                      Wrap(
                        spacing: 8,
                        children: [
                          ClipOval(
                            child: ColoredBox(
                              color: Colors.red.shade400,
                              child: const SizedBox(
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                          ClipOval(
                            child: ColoredBox(
                              color: Colors.green.shade400,
                              child: const SizedBox(
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                          ClipOval(
                            child: ColoredBox(
                              color: Colors.blue.shade400,
                              child: const SizedBox(
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                          ClipOval(
                            child: ColoredBox(
                              color: Colors.yellow.shade400,
                              child: const SizedBox(
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ...List.generate(
              modulos.length,
              (index) {
                return ModuleWidget(
                  id: modulos[index].id,
                  name: modulos[index].name,
                  iconName: modulos[index].icon,
                  state: modulos[index].state,
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
