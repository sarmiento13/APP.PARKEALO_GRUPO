import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../data/models/agency.dart';
import '../../../logic/providers/agency_provider.dart';
import '../../../logic/providers/category_provider.dart';

class ShowScreen extends StatelessWidget {
  final Agency agency;

  const ShowScreen({super.key, required this.agency});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgencyProvider>(context);
    final isFav = provider.isFavorite(agency.id);
    final categoryProvider = Provider.of<CategoryProvider>(context).categories;

    final indexCategory = categoryProvider
        .indexWhere((element) => element.id == agency.categoryId);
    final category = categoryProvider[indexCategory];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.go('/update/${agency.id}'),
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar',
          ),
          IconButton(
            onPressed: () {
              provider.toogleFavorite(agency.id);
            },
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline),
            tooltip: 'Favorito',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://placehold.co/400x250.png',
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://placehold.co/200x200.png'),
                        maxRadius: 32,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              agency.companyName,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(agency.services ?? ''),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (agency.description != null)
                    Column(
                      children: [
                        Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              agency.description!,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.assignment_outlined),
                            title: Text(agency.ruc),
                            visualDensity: VisualDensity.compact,
                            dense: true,
                          ),
                          if (agency.address != null)
                            ListTile(
                              leading: const Icon(Icons.map_outlined),
                              title: Text(agency.address!),
                              visualDensity: VisualDensity.compact,
                              dense: true,
                            ),
                          if (agency.reference != null)
                            ListTile(
                              leading: const Icon(Icons.library_books_outlined),
                              title: Text(agency.reference!),
                              visualDensity: VisualDensity.compact,
                              dense: true,
                            ),
                          if (agency.email != null)
                            ListTile(
                              leading: const Icon(Icons.email_outlined),
                              title: Text(agency.email!),
                              visualDensity: VisualDensity.compact,
                              dense: true,
                            ),
                          if (agency.cellPhoneNumber != null)
                            ListTile(
                              leading: const Icon(Icons.phone_outlined),
                              title: Text(agency.cellPhoneNumber!),
                              visualDensity: VisualDensity.compact,
                              dense: true,
                            ),
                          if (agency.schedules != null)
                            ListTile(
                              leading:
                                  const Icon(Icons.calendar_today_outlined),
                              title: Text(agency.schedules!),
                              visualDensity: VisualDensity.compact,
                              dense: true,
                            ),
                          if (agency.attentionTime != null)
                            ListTile(
                              leading: const Icon(Icons.access_time),
                              title: Text(agency.attentionTime!),
                              visualDensity: VisualDensity.compact,
                              dense: true,
                            ),
                          if (agency.location != null)
                            ListTile(
                              leading: const Icon(Icons.location_on_outlined),
                              title: Text(agency.location!),
                              visualDensity: VisualDensity.compact,
                              dense: true,
                            ),
                          ListTile(
                            leading: const Icon(Icons.category),
                            title: Text(category.name),
                            visualDensity: VisualDensity.compact,
                            dense: true,
                          ),
                          const ListTile(
                            leading: Icon(Icons.info_outline),
                            title: Text('Se unió el 10 oct 2024'),
                            visualDensity: VisualDensity.compact,
                            dense: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      provider.delete(agency.id!);
                      context.pop();
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Eliminiar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
