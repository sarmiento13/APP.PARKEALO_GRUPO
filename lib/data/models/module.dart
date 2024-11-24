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
}


// joinedDate: map['joined_date'] != null
//           ? DateTime.parse(map['joined_date'])
//           : null,