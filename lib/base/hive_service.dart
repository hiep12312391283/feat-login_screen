import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_screen/features/home/models/product.dart';

class HiveService {
  static late final Box _box;
  static late final Box<Product> cartBox;

  static Future<void> init() async {
    _box = await Hive.openBox('userBox');
    cartBox = await Hive.openBox('cartBox');
    Hive.registerAdapter(ProductAdapter());
  }

  static Future<void> clearToken() async {
    await _box.delete(_token);
  }

  static Future<void> addToCart(Product product) async {
    await cartBox.put(product.id, product);
  }

  static List<Product> getCartItem() {
    return cartBox.values.toList();
  }

  static Future<void> clearCart() async {
    await cartBox.clear();
  }

  static Future<void> deleteItem(int productId) async {
    await cartBox.delete(productId);
  }

  static bool isProductInCart(int productId) {
    return cartBox.containsKey(productId);
  }

  static const _taxCodeKey = "taxCode";
  static const _accountKey = "account";
  static const _passwordKey = "password";
  static const _logInKey = "isLoggedIn";
  static const _token = "token";

  static String? get taxCode {
    return _box.get(_taxCodeKey);
  }

  static Future<void> saveToken(String token) async {
    await _box.put(_token, token);
  }

  static String? getToken() {
    return _box.get(_token);
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
