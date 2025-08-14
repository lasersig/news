import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants.dart';
import '../../core/exceptions.dart';

class ApiService {
  ApiService._internal();
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  Future<Map<String, dynamic>> get(
      String path, {
        Map<String, String>? params,
      }) async {
    final uri = Uri.parse('${AppConstants.baseUrl}$path').replace(
      queryParameters: <String, String>{
        ...(params ?? {}),
        'apiKey': AppConstants.newsApiKey,
      },
    );

    final res = await http.get(uri);
    if (res.statusCode == 200) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    } else {
      throw ServerException('HTTP ${res.statusCode}: ${res.body}');
    }
  }
}
