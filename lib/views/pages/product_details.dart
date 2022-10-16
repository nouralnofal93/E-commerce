import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/views/widgets/drop_down_menu.dart';
import 'package:e_commerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFav = false;
  late String? dropDownSizeValue;
  late String? dropDownColorValue;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 228, 228),
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.product.title,
          style: Theme.of(context).textTheme.headline6,
        )),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(
            widget.product.imageUrl,
            width: double.infinity,
            height: size.height / 2,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: DropDownMenuComponant(
                            items: const ['XS', 'S', 'M', 'L'],
                            hint: "Size",
                            onChanged: (String? newValue) => {
                                  setState(() {
                                    dropDownSizeValue = newValue;
                                  }),
                                })),
                    const Spacer(),
                    Expanded(
                        child: DropDownMenuComponant(
                            items: const ['Black', 'White', 'Green'],
                            hint: "Color",
                            onChanged: (String? newValue) => {
                                  setState(() {
                                    dropDownColorValue = newValue;
                                  }),
                                })),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                      child: SizedBox(
                        height: 45,
                        width: 45,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              !isFav
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite_sharp,
                              color: !isFav ? Colors.black45 : Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text('\$${widget.product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w600))
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.product.category,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey.withOpacity(0.9)),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                    "This is the describtion of the product and we will addd it to firebase later."),
                const SizedBox(
                  height: 24.0,
                ),
                MainButton(
                  text: "Add To Cart",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 36.0,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
