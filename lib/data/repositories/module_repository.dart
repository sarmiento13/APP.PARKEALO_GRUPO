import 'package:voygo/data/models/module.dart';

abstract class ModuleRepository {
  Future<List<Module>> getAll();
}