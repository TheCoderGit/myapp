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
    DateTime? insertionDate,
    DateTime? lastModificationDate,
    AdminUserModel? insertBy,
  }) {
    return UserDeviceModel(
      id: id ?? this.id,
      model: model ?? this.model,
      inertionDate: inertionDate ?? this.inertionDate,
      lastModificationDate: lastModificationDate ?? this.lastModificationDate,
      insertedBy: insertedBy ?? this.insertedBy,
    );
  }

  


  @override
  String toString() {
    return "device model $model with id $id";
  }
}
