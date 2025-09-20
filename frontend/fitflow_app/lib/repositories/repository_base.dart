import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class RepositoryBase {
  late final String _baseUrl;
  final String path;

  RepositoryBase(this.path) {
    if (kIsWeb) {
      _baseUrl = 'http://localhost:5201/api/';
    } else if (Platform.isAndroid) {
      _baseUrl = 'http://10.0.2.2:5201/api/';
    } else {
      _baseUrl = 'http://localhost:5201/api/';
    }
  }

  String get fullUrl => '$_baseUrl$path';
}
