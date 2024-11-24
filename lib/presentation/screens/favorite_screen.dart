import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voygo/logic/providers/agency_provider.dart';

import '../../logic/providers/favorite_provider.dart';
import '../widgets/favorite_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    Provider.of<FavoriteProvider>(context, listen: false).getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final agencyProvider = Provider.of<AgencyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            favoriteProvider.favorites.length,
            (index) => FavoriteWidget(
              favorite: favoriteProvider.favorites[index],
              agency: agencyProvider
                  .getAgencyById(favoriteProvider.favorites[index].agencyId)!,
            ),
          ),
        ),
      ),
    );
  }
}
