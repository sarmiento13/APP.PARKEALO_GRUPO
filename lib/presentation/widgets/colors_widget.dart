import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/setting_provider.dart';

class ColorsWidget extends StatefulWidget {
  const ColorsWidget({super.key});

  @override
  State<ColorsWidget> createState() => _ColorsWidgetState();
}

class _ColorsWidgetState extends State<ColorsWidget> {
  int current = 2;
  final List<Color> myColors = [
    Colors.red.shade400,
    Colors.green.shade400,
    Colors.blue.shade400,
    Colors.yellow.shade400,
    Colors.orange.shade400,
  ];

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

    return Wrap(
      spacing: 4,
      children: List.generate(
        myColors.length,
        (index) => InkWell(
          onTap: () {
            settingProvider.toogleColors(myColors[index]);
            setState(() {
              current = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: index == current
                    ? Theme.of(context).colorScheme.primaryFixed
                    : Theme.of(context).scaffoldBackgroundColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipOval(
              child: ColoredBox(
                color: myColors[index],
                child: const SizedBox(
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
