import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Narmeshit',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text('Diseño & Equipo creativo'),
                ],
              ),
              const SizedBox(height: 16.0),
              Card(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.zero,
                child: Image.asset(
                  'assets/about/portada.jpg',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      'assets/vendors/logo.png',
                      height: 60,
                    ),
                  ),
                  // const Card(
                  //   elevation: 0,
                  //   margin: EdgeInsets.zero,
                  //   child: FlutterLogo(size: 60),
                  // ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Version: 1.0',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    'Herramientas de Desarrollo de Software II',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      text: 'Scrum Master: ',
                      style: Theme.of(context).textTheme.titleSmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Estudiante 01',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      text: 'Equipo de Desarrollo: ',
                      style: Theme.of(context).textTheme.titleSmall,
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Estudiante 02, Estudiante 03, Estudiante 04, Estudiante 05',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            const Text('Siguenos en:'),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/social/facebook.png'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/social/instagram.png'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/social/tiktok.png'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/social/twitter.png'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/social/youtube.png'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/social/dribbble.png'),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/social/github.png'),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
