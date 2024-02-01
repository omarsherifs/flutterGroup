import 'package:flutter/material.dart';
import 'package:flutter_group_1/screens/product_details_screen.dart';
import 'package:flutter_group_1/widgets/item_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> productNames = [
    "Product 1",
    "mobile",
    "mobile2",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productNames.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                          productName: productNames[index],
                        )),
              );
            },
            child: ItemCard(productName: productNames[index]));
      },
    );
  }
}
