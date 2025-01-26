class CategoryModel1 {
  final int id;
  final String name;
  final String? image;

  CategoryModel1({
    required this.id,
    required this.name,
    this.image,
  });

  // Factory method to parse JSON
  factory CategoryModel1.fromJson(Map<String, dynamic> json) {
    return CategoryModel1(
      id: json['category_id'],
      name: json['category_name'],
      image: json['category_image'],
    );
  }
}
