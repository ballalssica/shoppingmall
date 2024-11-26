import 'package:flutter/material.dart';
import 'package:shoppingmall/product_resistration/widget/inputbox.dart';
import 'package:shoppingmall/product_resistration/widget/resistration_button.dart';
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
      double? price;
      try {
        price = double.parse(_priceController.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid price entered')),
        );
        return;
      }

      final product = Product(
        image: _imageUrl,
        name: _nameController.text,
        description: _descriptionController.text,
        price: price,
      );

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 300,
                  color: Colors.blue,
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // InputBox 가로 중앙 정렬
                Center(
                  child: InputBox(
                    nameController: _nameController,
                    descriptionController: _descriptionController,
                    priceController: _priceController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: RegistrationButton(
        onPressed: _submitForm,
        nameController: _nameController, // 추가
        descriptionController: _descriptionController, // 추가
        priceController: _priceController, // 추가
      ),
    );
  }
}
