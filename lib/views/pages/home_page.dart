import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:e_commerce/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //TODO: Temp widget
  Widget _buildHeaderOfList(BuildContext context, String title, String subTitle,
      VoidCallback? onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            InkWell(
              onTap: onTap,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3.0),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppAssets.topBannerHomePAgeAsset,
                width: double.infinity,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                    width: double.infinity,
                    height: size.height * 0.3,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Text(
                  "Fashion Clothes",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                _buildHeaderOfList(context, "Sale", "Super Summer Sale", () {}),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 300,
            child: StreamBuilder<List<Product>>(
                stream: db.salesProductsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final products = snapshot.data;
                    if (products == null || products.isEmpty) {
                      return const Center(
                        child: Text("No Data Available"),
                      );
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: products
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListItemHome(product: e),
                              ))
                          .toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                _buildHeaderOfList(context, "New", "Super New Product", () {}),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
              height: 400,
              child: StreamBuilder<List<Product>>(
                  stream: db.newProductsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final products = snapshot.data;
                      if (products == null || products.isEmpty) {
                        return const Center(
                          child: Text("No Data Available"),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (_, int index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListNewItemHome(product: products[index]),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
