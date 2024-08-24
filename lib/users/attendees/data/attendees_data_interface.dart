abstract class DeviceDataInterface {
//to impletment the insert operation to the database
  Future<int> insertItem(Map<String, dynamic> item);

//to impletment the get all item operation to the database
  Future<List<Map<String, dynamic>>> getItems();

//to impletment the get one item operation to the database
  Future<List<Map<String, dynamic>>> getItem();

//to impletment the update operation to the database
  Future<int> updateItem(int id, Map<String, dynamic> item);

//to impletment the delete operation to the database
  Future<int> deleteItem(int id);
}