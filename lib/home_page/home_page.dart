import 'package:flutter/material.dart';
import '../models/product.dart';
import '../product_resistration/product_resistration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Static list to store products (in a real app, this would be in a database)
  static List<Product> products = [];

  // Method to add a product
  static void addProduct(Product product) {
    products.add(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일조동'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_basket_outlined),
            onPressed: () {
              // Navigate to cart
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(
              child: Text(
                '상품이 없습니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product-detail',
                        arguments: product,
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product.image.isNotEmpty)
                            Image.network(
                              product.image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  height: 200,
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product.description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '일조농장',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${product.price.toStringAsFixed(0)}원',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to ProductRegistration page and wait for result
          final result = await Navigator.push<Product>(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductRegistration(),
            ),
          );
          
          // If we got a product back and the widget is still mounted
          if (result != null && mounted) {
            setState(() {
              // Add the new product to our list
              products.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}