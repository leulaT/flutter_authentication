// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPersistService {
//   static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   static Future<String> read() async {
//     final SharedPreferences prefs = await _prefs;
//     print('=======read=====${prefs.getString('lang')}');
//     return prefs.getString('lang') ?? '';
//   }

//   static Future<String> readUser() async {
//     final SharedPreferences prefs = await _prefs;
//     print('=======read=====${prefs.getString('user')}');
//     return null;
//     // return prefs.getString('user') ?? null;
//   }

//   static void save(String lang) async {
//     final SharedPreferences prefs = await _prefs;
//     print('============$lang');
//     prefs.setString('lang', lang);
//   }

//   static void saveUser(String user) async {
//     final SharedPreferences prefs = await _prefs;
//     print('============$user');
//     prefs.setString('user', user);
//   }
// }
