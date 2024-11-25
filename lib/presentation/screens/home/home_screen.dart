import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/providers/agency_provider.dart';
import '../../../logic/providers/category_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  (index) {
                    final category = categoryProvider.categories[index];
                    return ChoiceChip(
                      selected:
                          categoryProvider.selected == index ? true : false,
                      onSelected: (value) {
                        categoryProvider.toogleCategory(index);
                        agencyProvider.getAllByCategoryId(category.id);
                      },
                      showCheckmark: false,
                      label: Text(category.name),
                      side: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.2),
                      ),
                    );
                  },
                ),
              ),
            ),
            categoryProvider.selected == null
                ? GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: agencyProvider.agencies.length,
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.63,
                    ),
                    itemBuilder: (context, index) {
                      final agency = agencyProvider.agencies[index];
                      return Card(
                        color: Colors.transparent,
                        elevation: 0,
                        borderOnForeground: true,
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.zero,
                        child: InkWell(
                          onTap: () => context.go('/show/${agency.id}'),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  'https://placehold.co/400x250.png',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      agency.companyName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      agency.location!,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: agencyProvider.categoryAgencies.length,
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.60,
                    ),
                    itemBuilder: (context, index) {
                      final agency = agencyProvider.categoryAgencies[index];
                      return Card(
                        color: Colors.transparent,
                        elevation: 0,
                        borderOnForeground: true,
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.zero,
                        child: InkWell(
                          onTap: () => context.go('/show/${agency.id}'),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  'https://placehold.co/400x250.png',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      agency.companyName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      agency.location!,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
