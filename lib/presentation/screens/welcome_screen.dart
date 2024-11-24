import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // const FlutterLogo(
              //   size: 150,
              // ),
              Card(
                margin: EdgeInsets.zero,
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/vendors/logo.png',
                  height: 150,
                ),
              ),
              const SizedBox(height: 48.0),
              Text(
                'Bienvenido a VoyGo',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Encuentra y reserva tu próxima aventura en un solo lugar.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                // width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('INICIAR SESION'),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                // width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('REGISTRARME'),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                // width: double.infinity,
                child: TextButton(
                  onPressed: () => context.go('/'),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('CONTINUAR'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
