class ProductModel {
  final int id;
  final String title;
  final int price;
  final int stock;
  final String thumbnail;
  final double discountPercentage;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.stock,
      required this.thumbnail,
      required this.discountPercentage});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      stock: json['stock'],
      thumbnail: json['thumbnail'],
      discountPercentage: json['discountPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'stock': stock,
      'thumbnail': thumbnail,
      'discountPercentage': discountPercentage,
    };
  }
}
