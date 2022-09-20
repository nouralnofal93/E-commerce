import 'package:e_commerce/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final int? discountValue;
  final String category;
  final int? rate;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      this.discountValue,
      this.category = 'Others',
      this.rate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'discountValue': discountValue,
      'category': category,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imageUrl: map['imageUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
      rate: map['rate'] as int,
    );
  }
}

List<Product> dummyProducts = [
  Product(
      id: "1",
      title: "T-Shirt",
      price: 300,
      imageUrl: AppAssets.tempProductAssets1,
      category: "Tops",
      discountValue: 20),
  Product(
      id: "2",
      title: "T-Shirt",
      price: 300,
      imageUrl: AppAssets.tempProductAssets1,
      category: "Tops",
      discountValue: 20),
  Product(
    id: "3",
    title: "T-Shirt",
    price: 300,
    imageUrl: AppAssets.tempProductAssets1,
    category: "Tops",
  ),
  Product(
      id: "4",
      title: "T-Shirt",
      price: 300,
      imageUrl: AppAssets.tempProductAssets1,
      category: "Tops",
      discountValue: 20),
  Product(
    id: "5",
    title: "T-Shirt",
    price: 300,
    imageUrl: AppAssets.tempProductAssets1,
    category: "Tops",
  ),
];
