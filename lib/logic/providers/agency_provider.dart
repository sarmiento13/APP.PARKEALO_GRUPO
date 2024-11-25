import 'package:flutter/material.dart';

import '../../data/repositories/agency_repository.dart';
import '../../data/repositories/agency_repository_impl.dart';
import '../../data/repositories/favorite_repository.dart';

import '../../data/models/agency.dart';
import '../../data/models/favorite.dart';
import '../../data/repositories/favorite_repository_impl.dart';

class AgencyProvider with ChangeNotifier {
  final AgencyRepository _agencyRepository = AgencyRepositoryImpl();
  final FavoriteRepository _favoriteRepository = FavoriteRepositoryImpl();

  List<Agency> _agencies = [];
  List<int> _favorites = [];
  List<Agency> _categoryAgencies = [];

  List<Agency> get agencies => _agencies;
  List<int> get favorites => _favorites;
  List<Agency> get categoryAgencies => _categoryAgencies;

  List<Agency> get favoritesAgencies {
    return _agencies.where((agency) => _favorites.contains(agency.id)).toList();
  }

  AgencyProvider() {
    _load();
  }

  Future<void> _load() async {
    _agencies = await _agencyRepository.getAll();
    _favorites = await _favoriteRepository.getAll();
    notifyListeners();
  }

  bool isFavorite(int? agencyId) {
    return _favorites.contains(agencyId);
  }

  Future<void> toogleFavorite(int? agencyId) async {
    if (isFavorite(agencyId!)) {
      await _favoriteRepository.delete(agencyId);
      _favorites.remove(agencyId);
    } else {
      final favorite = Favorite(agencyId: agencyId);
      await _favoriteRepository.create(favorite);
      _favorites.add(agencyId);
    }
    notifyListeners();
  }

  Future<void> create(Agency agency) async {
    final id = await _agencyRepository.create(agency);
    final agencyById = await _agencyRepository.getById(id);
    _agencies.add(agencyById!);
    notifyListeners();
  }

  Future<void> delete(int id) async {
    await _agencyRepository.delete(id);
    agencies.removeWhere((element) => element.id == id);
    categoryAgencies.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> getAllByCategoryId(int? categoryId) async {
    _categoryAgencies = [];
    _categoryAgencies = await _agencyRepository.getAllByCategoryId(categoryId!);
    notifyListeners();
  }
}
