import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {super.key,
      required this.title,
      required this.thumbnail,
      required this.price,
      required this.stock,
      required this.discountPercentage});

  final String thumbnail;
  final String title;
  final int price;
  final int stock;
  final double discountPercentage;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Rubik',
      fontSize: 35,
    );

    const textStyle2 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Rubik',
      fontSize: 18,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.83,
        child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    scale: 1,
                    width: 330,
                    height: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(title, style: textStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Price: ${price}USD", style: textStyle2),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Stock: $stock", style: textStyle2),
                      Text("Discount: $discountPercentage%", style: textStyle2),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
