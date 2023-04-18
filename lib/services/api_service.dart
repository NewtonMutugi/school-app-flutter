import 'package:school_app/models/task.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://localhost:3000/tasks'; // base URL for API

  // get all tasks
  Future<List<Task>> getTasks() async {
    final response = await http.get(Uri.parse(baseUrl)); // send GET request to API
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>; // decode response body
      return jsonData.map((taskData) => Task.fromJson(taskData)).toList(); // map JSON data to Task objects
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  // create new task
  Future<Task> createTask(Task task) async {
    final response = await http.post( // send POST request to API
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()), // encode Task object as JSON data
    );
    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body); // decode response body
      return Task.fromJson(jsonData); // map JSON data to Task object
    } else {
      throw Exception('Failed to create task');
    }
  }

  // update task
  Future<Task> updateTask(Task task) async {
    final response = await http.put( // send PUT request to API
      Uri.parse('$baseUrl/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()), // encode Task object as JSON data
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body); // decode response body
      return Task.fromJson(jsonData); // map JSON data to Task object
    } else {
      throw Exception('Failed to update task');
    }
  }

  // delete task
  Future<void> deleteTask(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id')); // send DELETE request to API
    if (response.statusCode != 204) {
      throw Exception('Failed to delete task');
    }
  }
}
