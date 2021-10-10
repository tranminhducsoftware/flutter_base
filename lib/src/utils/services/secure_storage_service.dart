import 'dart:convert';

import 'package:flutter_base/src/core/models/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final FlutterSecureStorage storage = new FlutterSecureStorage();

  static Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> persistToken(Token token) async {
    var tokenJson = jsonEncode(token);
    await storage.write(key: 'token', value: tokenJson);
  }

  static Future<Token?> getToken() async {
    var tokenJson = await storage.read(key: 'token');
    if (tokenJson != null) {
      var token = jsonDecode(tokenJson);
      return Token.fromJson(token);
    } else {
      return null;
    }
  }

  static Future<void> deleteToken() async {
    storage.delete(key: 'token');
  }
}
