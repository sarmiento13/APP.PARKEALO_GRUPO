import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../logic/providers/setting_provider.dart';
import '../presentation/screens/favorite_screen.dart';
import '../presentation/screens/feedback/feedback_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/profile_screen.dart';

class AppRouters extends StatefulWidget {
  const AppRouters({super.key});

  @override
  State<AppRouters> createState() => _AppRoutersState();
}

class _AppRoutersState extends State<AppRouters> {
  int _selectedIndex = 0;

  Widget screen() {
    return IndexedStack(
      index: _selectedIndex,
      children: const [
        HomeScreen(),
        FavoriteScreen(),
        FeedbackScreen(),
        ProfileScreen(),
      ],
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

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
        body: screen(),
        bottomNavigationBar: NavigationBar(
          // height: 67,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Inicio',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorito',
            ),
            NavigationDestination(
              icon: Icon(Icons.feedback_outlined),
              selectedIcon: Icon(Icons.feedback),
              label: 'Feedback',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
