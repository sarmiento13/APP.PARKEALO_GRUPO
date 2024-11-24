import 'dart:convert';
class Agency {
  final int? id;
  final String ruc;
  final String companyName;
  final String? address;
  final String? reference;
  final String? email;
  final String? services;
  final String? description;
  final String? cellPhoneNumber;
  final String? schedules;
  final String? attentionTime;
  final String? frontPage;
  final String? avatar;
  final String? location;
  final DateTime? joinedDate;
  final int categoryId;
  Agency({
    this.id,
    required this.ruc,
    required this.companyName,
    this.address,
    this.reference,
    this.email,
    this.services,
    this.description,
    this.cellPhoneNumber,
    this.schedules,
    this.attentionTime,
    this.frontPage,
    this.avatar,
    this.location,
    this.joinedDate,
    required this.categoryId,
  });

  @override
  String toString() {
    return 'Agency(id: $id, ruc: $ruc, companyName: $companyName, address: $address, reference: $reference, email: $email, services: $services, description: $description, cellPhoneNumber: $cellPhoneNumber, schedules: $schedules, attentionTime: $attentionTime, frontPage: $frontPage, avatar: $avatar, location: $location, joinedDate: $joinedDate, categoryId: $categoryId)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ruc': ruc,
      'company_name': companyName,
      'address': address,
      'reference': reference,
      'email': email,
      'services': services,
      'description': description,
      'cell_phone_number': cellPhoneNumber,
      'schedules': schedules,
      'attention_time': attentionTime,
      'front_page': frontPage,
      'avatar': avatar,
      'location': location,
      'joined_date': joinedDate?.millisecondsSinceEpoch,
      'category_id': categoryId,
    };
  }

  factory Agency.fromMap(Map<String, dynamic> map) {
    return Agency(
      id: map['id'] != null ? map['id'] as int : null,
      ruc: map['ruc'] as String,
      companyName: map['company_name'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      reference: map['reference'] != null ? map['reference'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      services: map['services'] != null ? map['services'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      cellPhoneNumber: map['cell_phone_number'] != null ? map['cell_phone_number'] as String : null,
      schedules: map['schedules'] != null ? map['schedules'] as String : null,
      attentionTime: map['attention_time'] != null ? map['attention_time'] as String : null,
      frontPage: map['front_page'] != null ? map['front_page'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      joinedDate: map['joined_date'] != null ? DateTime.parse(map['joined_date']) : null,
      categoryId: map['category_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Agency.fromJson(String source) => Agency.fromMap(json.decode(source) as Map<String, dynamic>);
}
