import 'dart:convert';
import 'package:http/http.dart' as http;

class DogApiService {
  final String baseUrl = 'https://dog.ceo/api';

  Future<Map<String, dynamic>> getAllBreeds() async {
    final response = await http.get(Uri.parse('$baseUrl/breeds/list/all'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  Future<String> getRandomImage(String breed) async {
    final response = await http.get(Uri.parse('$baseUrl/breed/$breed/images/random'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception('Failed to load image');
    }
  }
}
