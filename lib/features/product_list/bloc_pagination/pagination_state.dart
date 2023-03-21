part of 'pagination_bloc.dart';

abstract class PaginationState {
  final List<int> dataShow = [];
  final int page = 0;
  final int perPage = 10;
}

class PaginationInitial extends PaginationState {}

class NextPageState extends PaginationState {
  @override
  // ignore: overridden_fields
  final int page;
  @override
  // ignore: overridden_fields
  int perPage;
  @override
  // ignore: overridden_fields
  final List<int> dataShow;
  NextPageState(this.page, this.perPage, this.dataShow);
}
