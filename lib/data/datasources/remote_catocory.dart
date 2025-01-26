import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class RemoteDataSource {
  final String baseUrl = "https://app.ecominnerix.com/api/categories";

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // print('Raw API response: ${response.body}');

        if (data['data'] != null && data['data']['data'] is List) {
          return (data['data']['data'] as List)
              .map((json) => CategoryModel.fromJson(json))
              .toList();
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Exception occurred: $e');
      rethrow; 
    }
  }
}
