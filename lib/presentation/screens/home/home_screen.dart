import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:voygo/logic/providers/category_provider.dart';

import '../../../logic/providers/agency_provider.dart';
import '../../widgets/agency_widget.dart';
import '../../widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getAllCategory();
    Provider.of<AgencyProvider>(context, listen: false).getAllAgency();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final agencyProvider = Provider.of<AgencyProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoyGo'),
        actions: [
          IconButton(
            onPressed: () => context.go('/create'),
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'Nuevo',
          ),
        ],
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8,
                children: List.generate(
                  categoryProvider.categories.length,
                  (index) => CategoryWidget(
                    id: categoryProvider.categories[index].id,
                    name: categoryProvider.categories[index].name,
                    description: categoryProvider.categories[index].description,
                  ),
                ),
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.all(16.0),
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.60,
              children: List.generate(
                agencyProvider.agencies.length,
                (index) => AgencyWidget(agency: agencyProvider.agencies[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
