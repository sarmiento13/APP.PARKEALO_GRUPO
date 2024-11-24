import 'package:voygo/data/models/favorite.dart';

abstract class FavoriteRepository {
  Future<List<Favorite>> getAll();
  Future<Favorite?> getById(int id);
  Future<int> create(Favorite favorite);
  Future<int> update(Favorite favorite);
  Future<bool> delete(int id);
}
