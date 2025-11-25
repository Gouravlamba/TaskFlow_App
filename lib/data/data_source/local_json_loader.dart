import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class LocalJsonLoader {
  Future<List<Map<String, dynamic>>> loadTasksJson() async {
    final raw = await rootBundle.loadString('assets/tasks.json');
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded.cast<Map<String, dynamic>>();
  }
}
