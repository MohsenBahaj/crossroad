import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static const _baseUrl = '';
  // get method
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _hamdleResponse(response);
  }

  //post method
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    return _hamdleResponse(response);
  }

  //put method
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    return _hamdleResponse(response);
  }

//delete methid
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _hamdleResponse(response);
  }

  //handle respose
  static Future<Map<String, dynamic>> _hamdleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data : ${response.statusCode}');
    }
  }
}
