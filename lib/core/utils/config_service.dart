import 'dart:convert';
import 'package:challenge_banpay/core/utils/global.dart';
import 'package:flutter/services.dart';

class ConfigService {
  late Map<String, dynamic> _config;

  Future<void> loadConfig() async {
    String path = 'assets/${Global.env!.name}/config.json';
    String jsonString = await rootBundle.loadString(path);
    _config = jsonDecode(jsonString);
  }

  String getBaseUrl(String serviceName) {
    var endpoint = _config["endpoint"].firstWhere(
      (e) => e["endpoint"] == serviceName,
      orElse: () => null,
    );
    return endpoint != null ? endpoint["urls"].first : "";
  }

  bool isSslEnabled() {
    return _config["ssl"]["enabled"] ?? false;
  }
}
