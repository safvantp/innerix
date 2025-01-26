import 'package:ecom/presentation/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        title: const Center(
          child: Text(
            'Categories',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.categories.isEmpty) {
          return const Center(child: Text('No categories found'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return Container(
              width: screenWidth * 0.7, 
              height: screenHeight * 0.2,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        category.categoryName ?? 'Unknown Category',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, 
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  category.categoryImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            category.categoryImage!,
                            width: screenWidth * 0.2, 
                            height: screenWidth * 0.2,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 50),
                          ),
                        )
                      : const Icon(Icons.image_not_supported, size: 50),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
