import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LocalDataSource{
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();


  Future<String> readFromStorage(String key) async{
    final data = await _secureStorage.read(key: key) ?? "";
    return data;
  }

  Future<void> writeToStorage(String key, String val) async{
    await _secureStorage.write(key: key, value: val);
  }

  Future<void> deleteFromStorage(String key) async{
     await _secureStorage.delete(key: key);
}
}