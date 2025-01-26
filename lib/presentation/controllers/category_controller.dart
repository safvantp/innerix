import 'package:ecom/domain/entities/category_entity.dart';
import 'package:ecom/domain/usucases/get_categories_usecase.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final GetCategoriesUseCase getCategoriesUseCase;

  var categories = <CategoryEntity>[].obs;
  var isLoading = false.obs;

  CategoryController({required this.getCategoriesUseCase});

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      final result = await getCategoriesUseCase();
      categories.value = result;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
