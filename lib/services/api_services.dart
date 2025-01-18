import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://official-joke-api.appspot.com';

  static Future<http.Response> fetchJokeTypes() async {
    var response = await http.get(Uri.parse('$baseUrl/types'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load joke types');
    }
  }


  static Future<dynamic> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load jokes');
    }
  }


  static Future<dynamic> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      var data = jsonDecode(response.body);
      print("data $data");
      return data;
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}


