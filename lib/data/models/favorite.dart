// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Favorite {
  final int? id;
  final DateTime? dateAdded;
  final int agencyId;
  Favorite({
    this.id,
    this.dateAdded,
    required this.agencyId,
  });
  
  @override
  String toString() => 'Favorite(id: $id, dateAdded: $dateAdded, agencyId: $agencyId)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date_added': dateAdded?.millisecondsSinceEpoch,
      'agency_id': agencyId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] != null ? map['id'] as int : null,
      dateAdded: map['date_added'] != null ? DateTime.parse(map['date_added']) : null,
      agencyId: map['agency_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) => Favorite.fromMap(json.decode(source) as Map<String, dynamic>);
}
