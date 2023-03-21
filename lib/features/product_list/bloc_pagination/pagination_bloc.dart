import 'package:flutter_bloc/flutter_bloc.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(PaginationInitial()) {
    on<PaginationEvent>((event, emit) {});

    on<NextPageEvent>((event, emit) {
      final List<int> data = List.generate(100, (i) => i);
      final dataShow = data.sublist((event.page * event.perPage),
          ((event.page * event.perPage) + event.perPage));

      emit(NextPageState(event.page, event.perPage, dataShow));
    });
  }
}
