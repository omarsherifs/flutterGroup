import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String productName;
  final String price;
  final String thumbnail;
  const ItemCard({
    Key? key,
    required this.productName,
    required this.price,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 70, height: 70, child: Image.network(thumbnail)),
            Text(productName),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text("$price\$"),
          ],
        ),
      ),
    );
  }
}
