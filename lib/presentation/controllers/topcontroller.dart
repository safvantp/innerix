import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../data/models/topmodel.dart';

class TopSellingController extends GetxController {
  var topSellingItems = <TopSellingItem>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchTopSellingItems();
    super.onInit();
  }

  Future<void> fetchTopSellingItems() async {
    final url = Uri.parse('https://app.ecominnerix.com/api/v1/home');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = (data['best_offers']['items'] as List)
            .map((item) => TopSellingItem.fromJson(item))
            .toList();
        topSellingItems.value = items;
      } else {
        throw Exception('Failed to load top-selling items');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}