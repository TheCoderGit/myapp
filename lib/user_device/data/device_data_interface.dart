abstract class DeviceDataInterface {
//to impletment the insert Device operation to the database
  Future<int> insertDevice(Map<String, dynamic> item);

//to impletment the get all Device operation to the database
  Future<List<Map<String, dynamic>>> getDevices();

//to impletment the get one Device operation to the database
  Future<List<Map<String, dynamic>>> getDevice();

//to impletment the update Device operation to the database
  Future<int> updateDevice(int id, Map<String, dynamic> item);

//to impletment the delete Device operation to the database
  Future<int> deleteDevice(int id);
}
