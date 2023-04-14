import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:school_app/models/task.dart';

class API {
  static const baseUrl = 'http://localhost:3000/api/v1';

  // function to make a GET request
  static Future<dynamic> get(String url) async {
    var response = await http.get(Uri.parse(baseUrl + url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  // function to make a POST request
  static Future<dynamic> post(String url, dynamic data) async {
    var response = await http.post(
      Uri.parse(baseUrl + url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create data');
    }
  }

  // function to make a PUT request
  static Future<dynamic> put(String url, dynamic data) async {
    var response = await http.put(
      Uri.parse(baseUrl + url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update data');
    }
  }

  // function to make a DELETE request
  static Future<dynamic> delete(String url) async {
    var response = await http.delete(Uri.parse(baseUrl + url));

    if (response.statusCode == 204) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete data');
    }
  }
}

