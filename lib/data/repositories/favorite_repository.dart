import 'package:voygo/data/models/favorite.dart';

abstract class FavoriteRepository {
  Future<List<int>> getAll();
  Future<Favorite?> getById(int id);
  Future<int> create(Favorite favorite);
  Future<int> update(Favorite favorite);
  Future<int> delete(int agencyId);
}
