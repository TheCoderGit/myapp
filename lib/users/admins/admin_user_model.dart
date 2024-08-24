import 'dart:convert';

class AdminUserModel {
  int id;
  String name;
  AdminUserModel({
    required this.id,
    required this.name,
  });

  AdminUserModel copyWith({
    int? id,
    String? name,
  }) {
    return AdminUserModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory AdminUserModel.fromMap(Map<String, dynamic> map) {
    return AdminUserModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminUserModel.fromJson(String source) => AdminUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdminUserModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant AdminUserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
