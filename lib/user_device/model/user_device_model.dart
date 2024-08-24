import 'dart:convert';

import 'package:myapp/users/admins/admin_user_model.dart';

class UserDeviceModel {
  int id;
  String model;
  DateTime inertionDate;
  DateTime lastModificationDate;
  AdminUserModel insertedBy;
  UserDeviceModel({
    required this.id,
    required this.model,
    required this.inertionDate,
    required this.lastModificationDate,
    required this.insertedBy,
  });

  

  UserDeviceModel copyWith({
    int? id,
    String? model,
    DateTime? inertionDate,
    DateTime? lastModificationDate,
    AdminUserModel? insertedBy,
  }) {
    return UserDeviceModel(
      id: id ?? this.id,
      model: model ?? this.model,
      inertionDate: inertionDate ?? this.inertionDate,
      lastModificationDate: lastModificationDate ?? this.lastModificationDate,
      insertedBy: insertedBy ?? this.insertedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'model': model,
      'inertionDate': inertionDate.millisecondsSinceEpoch,
      'lastModificationDate': lastModificationDate.millisecondsSinceEpoch,
      'insertedBy': insertedBy.toMap(),
    };
  }

  factory UserDeviceModel.fromMap(Map<String, dynamic> map) {
    return UserDeviceModel(
      id: map['id'] as int,
      model: map['model'] as String,
      inertionDate: DateTime.fromMillisecondsSinceEpoch(map['inertionDate'] as int),
      lastModificationDate: DateTime.fromMillisecondsSinceEpoch(map['lastModificationDate'] as int),
      insertedBy: AdminUserModel.fromMap(map['insertedBy'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDeviceModel.fromJson(String source) => UserDeviceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDeviceModel(id: $id, model: $model, inertionDate: $inertionDate, lastModificationDate: $lastModificationDate, insertedBy: $insertedBy)';
  }

  @override
  bool operator ==(covariant UserDeviceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.model == model &&
      other.inertionDate == inertionDate &&
      other.lastModificationDate == lastModificationDate &&
      other.insertedBy == insertedBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      model.hashCode ^
      inertionDate.hashCode ^
      lastModificationDate.hashCode ^
      insertedBy.hashCode;
  }
}
