class CategoryEntity {
  final int categoryId;
  final String categoryName;
  final String? categoryImage;

  CategoryEntity({
    required this.categoryId,
    required this.categoryName,
    this.categoryImage,
  });
}
