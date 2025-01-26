class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String? categoryImage;

  // Constructor
  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    this.categoryImage,
  });

  // Factory method for converting JSON to CategoryModel
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'],  // Assuming the key is 'category_id'
      categoryName: json['category_name'],  // Assuming the key is 'category_name'
      categoryImage: json['category_image'],  // Assuming the key is 'category_image'
    );
  }

  // Method for converting CategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'category_image': categoryImage,
    };
  }
}
