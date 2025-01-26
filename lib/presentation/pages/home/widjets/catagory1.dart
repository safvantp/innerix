import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom/presentation/controllers/catagogory_controler1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize CategoryController using Get.put
    final CategoryController1 categoryController = Get.put(CategoryController1());

    return Obx(
      () {
        // Use Obx to listen to the changes in the categories list
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("View All tapped");
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Horizontal list of categories
            Container(
              height: 110, // Increased height for better spacing
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  // Access categories from the controller
                  var category = categoryController.categories[index];

                  return Column(
                    children: [
                      const SizedBox(height: 5),
                      // Updated Container (removed circle clipping)
                      CircleAvatar(
                        child: category.image == null || category.image!.isEmpty
                            ? Center(
                                child: Icon(
                                  Icons.image, // You can replace this with any placeholder icon
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 10),  // Adjusted the gap here for better spacing
                      // Category name
                      AutoSizeText(
                        category.name,  // Category name
                        maxLines: 1, // Ensure text doesn't go beyond one line
                        minFontSize: 8, // Minimum font size
                        maxFontSize: 12, // Maximum font size
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis, // Prevent text overflow
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 25),
                itemCount: categoryController.categories.length, // Use the length of the list
              ),
            ),
          ],
        );
      },
    );
  }
}
