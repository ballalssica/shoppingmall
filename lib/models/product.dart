import 'package:flutter/foundation.dart';

class Product {
  final String image;
  final String name;
  final String description;
  final double price;
  
  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
}