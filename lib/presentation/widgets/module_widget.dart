import 'package:flutter/material.dart';

import '../../core/utils/string_utils.dart';

class ModuleWidget extends StatelessWidget {
  final int? id;
  final String name;
  final String iconName;
  final bool state;

  const ModuleWidget({
    super.key,
    this.id,
    required this.name,
    required this.iconName,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return state
        ? ListTile(
            leading: Icon(StringUtils().iconMapping[iconName] ?? Icons.help),
            title: Text(name),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text('$name no implementado.'),
                  duration: const Duration(milliseconds: 1500),
                ),
              );
            })
        : const SizedBox();
  }
}
