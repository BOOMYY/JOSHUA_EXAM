import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  const ItemWidgets(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  final String image;
  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Rubik',
      fontSize: 20,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: 350,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffADD8E6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    scale: 1,
                    width: 330,
                    height: 200,
                  ),
                ),
                Center(child: Text(title, style: textStyle)),
                Center(child: Text("$price USD", style: textStyle)),
              ],
            )),
      ],
    );
  }
}
