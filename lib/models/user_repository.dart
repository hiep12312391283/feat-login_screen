import 'package:hive_flutter/hive_flutter.dart';

class UserRepository {
  static late final Box _box;

  static Future<void> init() async {
    _box = await Hive.openBox('userBox');
  }
  static const _taxCodeKey = "taxCode";
  static const _accountKey = "account";
  static const _passwordKey = "password";
  static const _logInKey = "isLoggedIn";


  static String? get taxCode {
    return _box.get(_taxCodeKey);
  }

  static Future<void> saveTaxCode(String taxCode) async {
    await _box.put(_taxCodeKey, taxCode);
  }

  static String? get account {
    return _box.get(_accountKey);
  }

  static Future<void> saveAccount(String account) async {
    await _box.put(_accountKey, account);
  }

  static String? get password {
    return _box.get(_passwordKey);
  }

  static Future<void> savePassword(String password) async {
    await _box.put(_passwordKey, password);
  }

  static bool get isLoggedIn {
    return _box.get(_logInKey, defaultValue: false);
  }

  static Future<void> setLoggedIn(bool loggedIn) async {
    await _box.put(_logInKey, loggedIn);
  }
}
