import 'dart:io';

import 'package:myapp/users/admins/data/admin_data_interface.dart';
import 'package:myapp/users/admins/data/admin_database_helper.dart';
import 'package:myapp/users/admins/data/admin_windows_os_database_helper.dart';

class AdminLocalData implements AdminDataInterface {
  // ignore: prefer_typing_uninitialized_variables
  late var databaseHelper;

  AdminLocalData() {
    if (Platform.isWindows || Platform.isLinux) {
      databaseHelper = AdminWindowsOsDatabaseHelper();
    } else {
      databaseHelper = AdminDatabaseHelper();
    }
  }

  @override
  Future<int> deleteAdmin(int id) async {
    return databaseHelper.deleteAdmin(id);
  }

  @override
  Future<List<Map<String, dynamic>>> getAdmins() async {
    return databaseHelper.getAdmins();
  }

  @override
  Future<int> insertAdmin(Map<String, dynamic> admin) async {
    return databaseHelper.insertAdmin(admin);
  }

  @override
  Future<int> updateAdmin(int id, Map<String, dynamic> admin) async {
    return databaseHelper.updateAdmin(id, admin);
  }

  @override
  Future<List<Map<String, dynamic>>> getAdminById(int id) {
    return databaseHelper.getaDminById(id);
  }

  @override
  Future<List<Map<String, dynamic>>> getAdminByUserName(String userName) {
    return databaseHelper.getAdminByUserName(userName);
  }
}
