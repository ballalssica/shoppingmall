class Product {
  final String id;
  final String name;
  final double price;
  final String? imageUrl;
  final String? description;
  final String sellerId;
  final DateTime createdAt;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.description,
    required this.sellerId,
    required this.createdAt,
    required this.stock,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'description': description,
        'sellerId': sellerId,
        'createdAt': createdAt.toIso8601String(),
        'stock': stock,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price'].toDouble(),
        imageUrl: json['imageUrl'],
        description: json['description'],
        sellerId: json['sellerId'],
        createdAt: DateTime.parse(json['createdAt']),
        stock: json['stock'],
      );
}
