import 'package:myapp/user_device/user_device_model.dart';
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is Attendee &&
        other.id == id &&
        other.name == name &&
        other.grade == grade &&
        other.userDevice == userDevice &&
        other.joinDate == joinDate &&
        other.lastModification == lastModification &&
        other.insertBy == insertBy;
  }

  @override
  String toString() {
    return '$name in grade $grade has ${userDevice.model}';
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        grade,
        userDevice,
        joinDate,
        lastModification,
        insertBy,
      );
}
