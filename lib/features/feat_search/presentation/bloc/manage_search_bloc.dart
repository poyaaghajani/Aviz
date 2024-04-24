import 'package:aviz/features/feat_search/data/repository/search_repository.dart';
import 'package:aviz/features/feat_search/presentation/bloc/get_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_search_event.dart';
part 'manage_search_state.dart';

class ManageSearchBloc extends Bloc<ManageSearchEvent, ManageSearchState> {
  final SearchRepository repository;

  ManageSearchBloc(this.repository)
      : super(ManageSearchState(
          getStatus: SearchGetLoading(),
        )) {
    on<SearchGetRequest>(onSearchGetRequest);
  }

  onSearchGetRequest(
      SearchGetRequest event, Emitter<ManageSearchState> emit) async {
    if (event.needRefresh) {
      emit(state.copyWith(newGetStatus: SearchGetLoading()));
    }

    final response = await repository.getAdverts(
      query: event.query,
      page: event.page,
    );

    response.fold(
      (error) => emit(state.copyWith(newGetStatus: SearchGetError(error))),
      (success) => emit(
          state.copyWith(newGetStatus: SearchGetSuccess(response: success))),
    );
  }
}
