import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data/data_05.dart';
import 'widgets/dot_indicator_widget_05.dart';
import 'widgets/onboarding_widget_05.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: data05.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingWidget05(
                    color: data05[index].color,
                    image: data05[index].image,
                    title: data05[index].title,
                    description: data05[index].description,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          data05.length,
                          (index) => GestureDetector(
                            onTap: () => pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            ),
                            child: DotIndicatorWidget05(
                                isActive: index == currentPage),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: currentPage == data05.length - 1
                            ? () => context.go('/welcome')
                            : () {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                        child: Text(currentPage == data05.length - 1
                            ? 'COMIENZA AHORA'
                            : 'SIGUIENTE'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: currentPage != data05.length - 1
                    ? () {
                        pageController.animateToPage(
                          data05.length,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    : null,
                child: const Text('SALTAR'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
