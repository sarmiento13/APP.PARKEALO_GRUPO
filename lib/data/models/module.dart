// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Module {
  int? id;
  String name;
  String icon;
  DateTime? dateAdded;
  bool state;
  Module({
    this.id,
    required this.name,
    required this.icon,
    this.dateAdded,
    this.state = true,
  });

  @override
  String toString() {
    return 'Module(id: $id, name: $name, icon: $icon, dateAdded: $dateAdded, state: $state)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
      'dateAdded': dateAdded?.millisecondsSinceEpoch,
      'state': state ? 1 : 0,
    };
  }

  factory Module.fromMap(Map<String, dynamic> map) {
    return Module(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      icon: map['icon'] as String,
      dateAdded: map['date_added'] != null ? DateTime.parse(map['date_added']) : null,
      state: map['state'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory Module.fromJson(String source) => Module.fromMap(json.decode(source) as Map<String, dynamic>);
}
