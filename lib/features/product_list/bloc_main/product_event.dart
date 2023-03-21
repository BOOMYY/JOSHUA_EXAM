part of 'product_bloc.dart';

abstract class ProductEvent {
  ProductEvent();
}

class FetchProductEvent extends ProductEvent {}

class PaginationEvent extends ProductEvent {}
