import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'T-shirt',
          style: Theme.of(context).textTheme.headline6,
        )),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
    );
  }
}
