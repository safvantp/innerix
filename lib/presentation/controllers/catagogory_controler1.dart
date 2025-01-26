import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../data/models/dummycatatory.dart';

class CategoryController1 extends GetxController {
  var categories = <CategoryModel1>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    final url = Uri.parse('https://app.ecominnerix.com/api/v1/home'); 
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = (data['categories']['items'] as List)
            .map((item) => CategoryModel1.fromJson(item))
            .toList();
        categories.value = items; 
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
