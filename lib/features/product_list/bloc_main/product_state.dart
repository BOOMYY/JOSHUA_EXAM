part of 'product_bloc.dart';

abstract class ProductState {
  ProductState();

  final List<ProductModel> products = [];
}

class ProductInitial extends ProductState {}

class FetchProductState extends ProductState {
  FetchProductState(this.products);
  @override
  // ignore: overridden_fields
  final List<ProductModel> products;
}

