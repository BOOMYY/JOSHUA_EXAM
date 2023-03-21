import 'package:exam_flutter/features/product_list/bloc_main/product_bloc.dart';
import 'package:exam_flutter/features/product_list/bloc_pagination/pagination_bloc.dart';
import 'package:exam_flutter/features/product_list/components/list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return SingleChildScrollView(
      child: BlocBuilder<ProductBloc, ProductState>(
          buildWhen: (previousState, state) => state is FetchProductState,
          builder: (context, state) {
            context.read<ProductBloc>().add(FetchProductEvent());
            if (state is! FetchProductState) {
              return const Center(child: CircularProgressIndicator());
            }
            return BlocBuilder<PaginationBloc, PaginationState>(
              builder: (context, page) {
                return Scrollbar(
                  controller: controller,
                  thumbVisibility: true,
                  interactive: true,
                  thickness: 10,
                  trackVisibility: true,
                  radius: const Radius.circular(10),
                  child: Column(
                    children: [
                      ListItems(
                          controller: controller, page: page, state: state),
                      page.perPage < state.products.length && page.perPage <= 10
                          ? TextButton(
                              onPressed: () {
                                context.read<PaginationBloc>().add(
                                    NextPageEvent(page.page, page.perPage + 5));
                              },
                              child: Container(
                                  width: 100,
                                  height: 50,
                                  color:
                                      const Color.fromARGB(255, 218, 238, 255),
                                  child: const Center(child: Text("More"))))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      context.read<PaginationBloc>().add(
                                          NextPageEvent(
                                              page.page, page.perPage - 5));
                                    },
                                    child: Container(
                                        width: 100,
                                        height: 50,
                                        color: const Color.fromARGB(
                                            255, 218, 238, 255),
                                        child:
                                            const Center(child: Text("Less")))),
                                page.perPage == state.products.length
                                    ? const SizedBox()
                                    : TextButton(
                                        onPressed: () {
                                          context.read<PaginationBloc>().add(
                                              NextPageEvent(
                                                  page.page, page.perPage + 5));
                                        },
                                        child: Container(
                                            width: 100,
                                            height: 50,
                                            color: const Color.fromARGB(
                                                255, 218, 238, 255),
                                            child: const Center(
                                                child: Text("More"))))
                              ],
                            ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
