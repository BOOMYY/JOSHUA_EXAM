import 'dart:convert';

import 'package:exam_flutter/data/constant.dart';
import 'package:exam_flutter/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});

    on<FetchProductEvent>((event, emit) async {
      final url = Uri.parse(ApiAccess.allProduct);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        List<ProductModel> products = [];

        for (var product in body['products']) {
          products.add(ProductModel.fromJson(product));
        }
        emit(FetchProductState(products));
      } else {
        throw Exception('Failed to load products');
      }
    });
  }
}
