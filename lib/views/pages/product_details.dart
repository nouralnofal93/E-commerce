import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T-shirt'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
    );
  }
}
