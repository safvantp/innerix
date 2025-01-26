class TopSellingItem {
  final int productId;
  final String sku;
  final String name;
  final String description;
  final String shortDescription;
  final String? thumbnailImage;
  final double price;

  TopSellingItem({
    required this.productId,
    required this.sku,
    required this.name,
    required this.description,
    required this.shortDescription,
    this.thumbnailImage,
    required this.price,
  });

  factory TopSellingItem.fromJson(Map<String, dynamic> json) {
    return TopSellingItem(
      productId: json['product_id'],
      sku: json['sku'],
      name: json['name'],
      description: json['description'],
      shortDescription: json['short_description'],
      thumbnailImage: json['thumbnail_image'],
      price: json['price'].toDouble(),
    );
  }
}