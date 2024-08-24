abstract class AdminDataInterface {
//to impletment the insert Admin operation to the database
  Future<int> insertAdmin(Map<String, dynamic> item);

//to impletment the get all Admin operation to the database
  Future<List<Map<String, dynamic>>> getAdmins();

//to impletment the get one Admin by id operation to the database
  Future<List<Map<String, dynamic>>> getAdminById(int id);

//to impletment the get one Adminby user name operation to the database
  Future<List<Map<String, dynamic>>> getAdminByUserName(String userName);

//to impletment the update Admin operation to the database
  Future<int> updateAdmin(int id, Map<String, dynamic> item);

//to impletment the delete Admin operation to the database
  Future<int> deleteAdmin(int id);
}
