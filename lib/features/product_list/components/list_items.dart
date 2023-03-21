import 'package:exam_flutter/features/product_details/product_details.dart';
import 'package:exam_flutter/features/product_list/bloc_main/product_bloc.dart';
import 'package:exam_flutter/features/product_list/bloc_pagination/pagination_bloc.dart';
import 'package:exam_flutter/features/product_list/components/item_widgets.dart';
import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
    required this.controller,
    required this.page,
    required this.state,
  }) : super(key: key);

  final ScrollController controller;
  final PaginationState page;
  final ProductState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.83,
      child: ListView.builder(
        controller: controller,
        shrinkWrap: true,
        itemExtent: 300,
        padding: const EdgeInsets.only(top: 30.0),
        reverse: false,
        itemCount: page.dataShow.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetail(
                                title: state.products[index].title,
                                thumbnail: state.products[index].thumbnail,
                                price: state.products[index].price,
                                discountPercentage:
                                    state.products[index].discountPercentage,
                                stock: state.products[index].stock,
                              )));
                },
                child: ItemWidgets(
                  image: state.products[index].thumbnail,
                  title: state.products[index].title,
                  price: state.products[index].price,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
