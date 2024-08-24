import 'dart:convert';

import 'package:myapp/user_device/model/user_device_model.dart';
import 'package:myapp/users/admins/admin_user_model.dart';

class Attendee {
  int id;
  String name;
  String grade;
  UserDeviceModel userDevice;
  DateTime joinDate;
  DateTime lastModification;
  AdminUserModel insertBy;
  Attendee({
    required this.id,
    required this.name,
    required this.grade,
    required this.userDevice,
    required this.joinDate,
    required this.lastModification,
    required this.insertBy,
  });

  

  Attendee copyWith({
    int? id,
    String? name,
    String? grade,
    UserDeviceModel? userDevice,
    DateTime? joinDate,
    DateTime? lastModification,
    AdminUserModel? insertBy,
  }) {
    return Attendee(
      id: id ?? this.id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      userDevice: userDevice ?? this.userDevice,
      joinDate: joinDate ?? this.joinDate,
      lastModification: lastModification ?? this.lastModification,
      insertBy: insertBy ?? this.insertBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'grade': grade,
      'userDevice': userDevice.toMap(),
      'joinDate': joinDate.millisecondsSinceEpoch,
      'lastModification': lastModification.millisecondsSinceEpoch,
      'insertBy': insertBy.toMap(),
    };
  }

  factory Attendee.fromMap(Map<String, dynamic> map) {
    return Attendee(
      id: map['id'] as int,
      name: map['name'] as String,
      grade: map['grade'] as String,
      userDevice: UserDeviceModel.fromMap(map['userDevice'] as Map<String,dynamic>),
      joinDate: DateTime.fromMillisecondsSinceEpoch(map['joinDate'] as int),
      lastModification: DateTime.fromMillisecondsSinceEpoch(map['lastModification'] as int),
      insertBy: AdminUserModel.fromMap(map['insertBy'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Attendee.fromJson(String source) => Attendee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Attendee(id: $id, name: $name, grade: $grade, userDevice: $userDevice, joinDate: $joinDate, lastModification: $lastModification, insertBy: $insertBy)';
  }

  @override
  bool operator ==(covariant Attendee other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.grade == grade &&
      other.userDevice == userDevice &&
      other.joinDate == joinDate &&
      other.lastModification == lastModification &&
      other.insertBy == insertBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      grade.hashCode ^
      userDevice.hashCode ^
      joinDate.hashCode ^
      lastModification.hashCode ^
      insertBy.hashCode;
  }
}
