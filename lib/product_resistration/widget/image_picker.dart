
import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget{
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.blue,
      child: const Center(
        child: Icon(
          Icons.add,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}