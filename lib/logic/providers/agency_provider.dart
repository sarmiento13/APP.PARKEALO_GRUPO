import 'package:flutter/material.dart';

import '../../data/models/agency.dart';
import '../../data/repositories/agency_repository.dart';
import '../../data/repositories/agency_repository_impl.dart';

class AgencyProvider with ChangeNotifier {
  final AgencyRepository agencyRepository = AgencyRepositoryImpl();

  final List<Agency> _agencies = [];

  List<Agency> get agencies => _agencies;

  Future<void> getAllAgency() async {
    _agencies.addAll(await agencyRepository.getAll());
    notifyListeners();
  }

  void create(Agency agency) {
    _agencies.add(agency);
    notifyListeners();
  }

  List<Agency> readAll() {
    return _agencies;
  }

  Agency? getAgencyById(int id) {
    return _agencies.firstWhere((element) => element.id == id);
  }

  void update(Agency agency) {
    int index = _agencies.indexWhere((element) => element.id == agency.id);
    if (index != -1) {
      _agencies[index] = agency;
      notifyListeners();
    }
  }

  Future<void> delete(int id) async {
    _agencies.removeWhere((agency) => agency.id == id);
    await agencyRepository.delete(id);
    notifyListeners();
  }
}
