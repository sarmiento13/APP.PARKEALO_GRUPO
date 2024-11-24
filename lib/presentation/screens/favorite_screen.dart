import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/agency_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final provider = Provider.of<AgencyProvider>(context);
    final favorites = provider.favoritesAgencies;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorito'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No hay agencias en favoritos'))
          : ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final agency = favorites[index];
            return ListTile(
              leading: const CircleAvatar(
                maxRadius: 32,
                foregroundImage: AssetImage(
                  'assets/onboarding/01.jpg',
                ),
              ),
              title: Text(
                agency.companyName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'RUC: ${agency.ruc}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  provider.toogleFavorite(agency.id);
                },
                icon: const Icon(Icons.favorite),
              ),
              onTap: () => context.go('/show/${agency.id}'),
            );
          }),
    );
  }
}
