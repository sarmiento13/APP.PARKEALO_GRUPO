import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voygo/data/models/agency.dart';
import 'package:voygo/data/models/favorite.dart';
import 'package:voygo/logic/providers/favorite_provider.dart';

class AgencyWidget extends StatelessWidget {
  final Agency agency;

  const AgencyWidget({super.key, required this.agency});

  @override
  Widget build(BuildContext context) {

    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Card(
      color: Colors.transparent,
      elevation: 0,
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          final favorite = Favorite(agencyId: agency.id!);
          favoriteProvider.create(favorite);
        },
        // onTap: () => context.go('/show/${agency.id}'),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/onboarding/01.jpg',
                height: 110,
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
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    agency.location!,
                    style: Theme.of(context).textTheme.bodySmall,
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
