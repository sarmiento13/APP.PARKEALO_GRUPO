

import 'package:flutter/foundation.dart';

import '../../data/models/favorite.dart';
import '../../data/repositories/favorite_repository.dart';
import '../../data/repositories/favorite_repository_impl.dart';

class FavoriteProvider with ChangeNotifier {
  final FavoriteRepository favoriteRepository = FavoriteRepositoryImpl();

  final List<Favorite> _favorites = [];
  List<Favorite> get favorites => _favorites;

  Future<void> getAll() async {
    try {
      _favorites.addAll(await favoriteRepository.getAll());
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Favorite?> getById(int id) async {
    // return _favorites.firstWhere((element) => element.id == id);
    return await favoriteRepository.getById(id);
  }

  Future<void> create(Favorite favorite) async {
    try {
      final model = await favoriteRepository.getById(
        await favoriteRepository.create(favorite),
      );
      _favorites.add(model!);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  void delete(int id) async {
    try {
      await favoriteRepository.delete(id);
      _favorites.removeWhere((element) => element.id == id);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
