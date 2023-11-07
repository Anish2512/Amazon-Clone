import 'dart:convert';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
  });
  // rating
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
    };
  }

  // factory Product.fromMap(Map<String, dynamic> map) {
  //   return Product(
  //     name: map['name'] as String,
  //     description: map['description'] as String,
  //     quantity: map['quantity'] as double,
  //     images: List<String>.from(map['images'] as List<String>),
  //     category: map['category'] as String,
  //     price: map['price'] as double,
  //     id: map['_id'] != null ? map['id'] as String : null,
  //   );
  // }

factory Product.fromMap(Map<String, dynamic> map) {
  List<String> parsedImages = [];

  if (map['images'] is List) {
    for (var item in map['images']) {
      if (item is String) {
        parsedImages.add(item);
      } else {
        // Handle non-string items (e.g., convert to String)
        parsedImages.add(item?.toString() ?? ''); // Use an empty string if it's null
      }
    }
  }

  return Product(
    name: map['name'] as String? ?? '', // Use an empty string if it's null
    description: map['description'] as String? ?? '', // Use an empty string if it's null
    quantity: (map['quantity'] is int) ? (map['quantity'] as int).toDouble() : (map['quantity'] as double? ?? 0.0), // Use 0.0 if it's null
    images: parsedImages,
    category: map['category'] as String? ?? '', // Use an empty string if it's null
    price: (map['price'] is int) ? (map['price'] as int).toDouble() : (map['price'] as double? ?? 0.0), // Use 0.0 if it's null
    id: map['_id'] as String? ?? '', // Use an empty string if it's null
  );
}



  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
