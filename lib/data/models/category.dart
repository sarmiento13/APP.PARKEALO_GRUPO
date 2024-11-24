// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  int? id;
  String name;
  String? description;
  Category({
    this.id,
    required this.name,
    this.description,
  });

  @override
  String toString() =>
      'Category(id: $id, name: $name, description: $description)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
