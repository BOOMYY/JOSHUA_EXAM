part of 'pagination_bloc.dart';

abstract class PaginationEvent {}

class NextPageEvent extends PaginationEvent {
  NextPageEvent(this.page, this.perPage);
  final int page;
  final int perPage;
}
