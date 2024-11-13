import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;
  static const _userId = 'id';
  static const _language = 'lang';
  static const _token = 'token';
  static const _deviceToken = 'deviceToken';
  static const _type = 'type';

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setUserId(String? id) async {
    await _preferences.setString(_userId, id ?? '');
  }

  static String getUserId() {
    return _preferences.getString(_userId) ?? '';
  }

  static setUserToken(String? token) async {
    await _preferences.setString(_token, token ?? '');
  }

  static String getUserToken() {
    return _preferences.getString(_token) ?? '';
  }

  static setDeviceToken(String? deviceToken) async {
    await _preferences.setString(_deviceToken, deviceToken ?? '');
  }

  static String getDeviceToken() {
    return _preferences.getString(_deviceToken) ?? '';
  }

  static setUserType(String? type) async {
    await _preferences.setString(_type, type ?? '');
  }

  static String getUserType() {
    return _preferences.getString(_type) ?? '';
  }

  static removeUserId(String key) async {
    await _preferences.remove(_userId);
  }

  static clearData() async {
    await _preferences.clear();
  }

  static setLang(lang) async {
    await _preferences.setString(_language, lang);
  }

  static String getLang() {
    return _preferences.getString(_language) ?? "";
  }
}
