// File: lib/product_resistration/product_resistration.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductRegistration extends StatefulWidget {
  const ProductRegistration({super.key});

  @override
  State<ProductRegistration> createState() => _ProductRegistrationState();
}

class _ProductRegistrationState extends State<ProductRegistration> {
  final _formKey = GlobalKey<FormState>();
  String _imageUrl = '';
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Create a new Product instance
      final product = Product(
        image: _imageUrl,
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
      );

      // Return the product to the previous screen
      Navigator.pop(context, product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('농산물 등록하기'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image picker section
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _imageUrl.isEmpty
                      ? IconButton(
                          icon: const Icon(Icons.add_photo_alternate, size: 50),
                          onPressed: () {
                            // For now, just set a dummy image URL
                            setState(() {
                              _imageUrl = 'https://via.placeholder.com/200';
                            });
                          },
                        )
                      : Image.network(
                          _imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Product name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '상품명',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '상품명을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Product description field
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: '상품 설명',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '상품 설명을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Price field
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: '가격',
                  border: OutlineInputBorder(),
                  suffixText: '원',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '가격을 입력해주세요';
                  }
                  if (double.tryParse(value) == null) {
                    return '올바른 가격을 입력해주세요';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text('상품 등록하기'),
        ),
      ),
    );
  }
}