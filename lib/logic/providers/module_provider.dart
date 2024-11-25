import 'package:flutter/material.dart';
import 'package:voygo/data/models/module.dart';
import 'package:voygo/data/repositories/module_repository.dart';
import 'package:voygo/data/repositories/module_repository_impl.dart';

class ModuleProvider  with ChangeNotifier{
  final ModuleRepository _repository = ModuleRepositoryImpl();

  List<Module> _modules = [];

  List<Module> get modules => _modules;

  ModuleProvider() {
    _load();
  }

  Future<void> _load() async {
    _modules = await _repository.getAll();
    notifyListeners();
  }
}