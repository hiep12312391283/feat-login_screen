import 'package:hive_flutter/hive_flutter.dart';

class UserRepository {
  static late final Box _box;

  static Future<void> init() async {
    _box = await Hive.openBox('userBox');
  }

  static String? get taxCode {
    return _box.get('taxCode');
  }

  static Future<void> saveTaxCode(String taxCode) async {
    await _box.put('taxCode', taxCode);
  }

  static String? get account {
    return _box.get('account');
  }

  static Future<void> saveAccount(String account) async {
    await _box.put('account', account);
  }

  static String? get password {
    return _box.get('password');
  }

  static Future<void> savePassword(String password) async {
    await _box.put('password', password);
  }

  static bool get isLoggedIn {
    return _box.get('isLoggedIn', defaultValue: false);
  }

  static Future<void> setLoggedIn(bool loggedIn) async {
    _box.put('IsLoggedIn', loggedIn);
  }
}
