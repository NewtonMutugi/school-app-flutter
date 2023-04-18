import 'dart:convert';
import 'package:http/http.dart' as http;

// Replace the API_BASE_URL with your Rails API endpoint
const API_BASE_URL = 'http://10.0.2.2:3000/api/v1';

class Api {
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(Uri.parse('$API_BASE_URL/users/sign_in'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          'user': {'email': email, 'password': password}
        }));

    if (response.statusCode == 200) {
      // Successful login
      final responseData = jsonDecode(response.body);
      return {
        'success': true,
        'authToken': responseData['authentication_token'],
        'user_id': responseData['id'],
        'first_name': responseData['first_name'],
        'last_name': responseData['last_name'],
        'email': responseData['email'],
      };
    } else {
      // Login failed
      return {'success': false, 'message': 'Invalid email or password.'};
    }
  }

  static Future<Map<String, dynamic>> logout(String authToken) async {
    final response = await http.delete(
        Uri.parse('$API_BASE_URL/users/sign_out'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': authToken
        });

    if (response.statusCode == 200) {
      // Successful logout
      return {'success': true};
    } else {
      // Logout failed
      return {'success': false, 'message': 'Logout failed.'};
    }
  }

  static Future<Map<String, dynamic>> signUp(String firstName, String lastName,
      String email, String password, String passwordConfirmation) async {
    final response = await http.post(Uri.parse('$API_BASE_URL/users/sign_up'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          'user': {
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'password': password,
            'password_confirmation': passwordConfirmation
          }
        }));

    if (response.statusCode == 201) {
      // Successful sign up
      final responseData = jsonDecode(response.body);
      print(responseData);
      return {
        'success': true,
      };
    } else {
      // Sign up failed
      return {'success': false, 'message': 'Invalid email or password.'};
    }
  }

  static Future<void> fetchUnits() async {
    try {
      var response = await http.get(Uri.parse('$API_BASE_URL/units'));
      print(response.body);
      if (response.statusCode == 200) {
        var unitsJson = json.decode(response.body);
        print(unitsJson);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:school_app/models/task.dart';

// class API {
//   static const baseUrl = 'http://localhost:3000/api/v1';

//   // function to make a GET request
//   static Future<dynamic> get(String url) async {
//     var response = await http.get(Uri.parse(baseUrl + url));

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data from API');
//     }
//   }

//   // function to make a POST request
//   static Future<dynamic> post(String url, dynamic data) async {
//     var response = await http.post(
//       Uri.parse(baseUrl + url),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to create data');
//     }
//   }

//   // function to make a PUT request
//   static Future<dynamic> put(String url, dynamic data) async {
//     var response = await http.put(
//       Uri.parse(baseUrl + url),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to update data');
//     }
//   }

//   // function to make a DELETE request
//   static Future<dynamic> delete(String url) async {
//     var response = await http.delete(Uri.parse(baseUrl + url));

//     if (response.statusCode == 204) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to delete data');
//     }
//   }
// }

