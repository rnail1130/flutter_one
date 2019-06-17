import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  /// 存储本地信息;
  static set(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  /// 获取本地存储的json的信息，无信息则返回 null;
  static getjson(String key, Function callback) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.get(key);
    if (data != null)
      callback(json.decode(data));
    else
      callback(null);
  }

  /// 获取本地存储的string信息，无信息则返回 null;
  static getstring(String key, Function callback) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.get(key);
    callback(data);
  }

  /// 删除本地存储信息;
  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
