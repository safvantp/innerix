import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/topcontroller.dart';

class bestoffffer extends StatelessWidget {
  final TopSellingController topSellingController = Get.put(TopSellingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with "Top Selling" title and "View All" button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Selling',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to all top-selling items page
                  print("View All tapped");
                },
                child: const Text(
                  'View All',
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
        // Display loading or top-selling items
        Obx(() {
          if (topSellingController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (topSellingController.topSellingItems.isEmpty) {
            return const Center(child: Text('No items available'));
          } else {
            return Container(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  final item = topSellingController.topSellingItems[index];
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image (Handle null thumbnails)
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: item.thumbnailImage != null
                              ? Image.network(
                            item.thumbnailImage!,
                            width: double.infinity,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                              : Container(
                            width: double.infinity,
                            height: 80,
                            color: Colors.grey[200],
                            child: const Icon(Icons.image),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Subtitle
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item.shortDescription,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        // Price
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Text(
                            '\$${item.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemCount: topSellingController.topSellingItems.length,
              ),
            );
          }
        }),
      ],
    );
  }
}