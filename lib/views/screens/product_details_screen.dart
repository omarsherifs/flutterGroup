import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_1/models/products_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title ?? "--"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(),
          items: (widget.product.images ?? [])
              .map((item) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(item),
                    )),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Chip(label: Text("Brand:${widget.product.brand}")),
            Chip(label: Text("in stock: ${widget.product.stock}")),
          ],
        ),
        Chip(label: Text("Category:${widget.product.category}")),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Price: ${widget.product.price}",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("${widget.product.rating}"),
              const Icon(Icons.star),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.product.description ?? "--"),
        )
      ]),
    );
  }
}
