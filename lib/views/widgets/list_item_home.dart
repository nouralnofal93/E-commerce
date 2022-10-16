import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                product.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 50,
                height: 25,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.red),
                  child: Center(
                    child: Text(
                      '${product.discountValue}%',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          product.category,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 6.0),
        Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6.0),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '${product.price}\$',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.grey, decoration: TextDecoration.lineThrough),
            ),
            TextSpan(
                text:
                    ' ${product.price - (product.price * (product.discountValue ?? 0) / 100)}\$'),
          ]),
        ),
      ]),
    );
  }
}

class ListNewItemHome extends StatelessWidget {
  final Product product;
  const ListNewItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetailsRout, arguments: product),
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  product.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            product.category,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 6.0),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6.0),
          Text('${product.price}\$',
              style: Theme.of(context).textTheme.subtitle2),
        ]),
      ),
    );
  }
}
