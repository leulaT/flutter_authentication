import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();
  //uset to store token locally
  static storeToken({required key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

//used to logout by deleting saved token
  static deleteValue({String? key}) async {
    if (key == null || key.isEmpty) {
      _storage.deleteAll();
    } else {
      await _storage.delete(key: key);
    }
  }

  static void deleteAll() async {
    await _storage.deleteAll();
  }

  static Future<String?> readToken(String key) async {
    /// Read value
    var value = await _storage.read(key: key);

    return value;
  }

  static void storeAll({required Map<String, String> userMap}) {
    userMap.forEach((key, value) async {
      await _storage.write(key: key, value: value);
    });
  }
}
