import 'package:aviz/features/feat_home/data/repository/home_repository.dart';
import 'package:aviz/features/feat_home/presentation/bloc/get_home_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_home_event.dart';
part 'manage_home_state.dart';

class ManageHomeBloc extends Bloc<ManageHomeEvent, ManageHomeState> {
  final HomeRepository repository;

  ManageHomeBloc(this.repository)
      : super(ManageHomeState(
          getStatus: HomeGetLoading(),
        )) {
    on<GetHomeRequest>(onGetHomeRequest);
  }

  onGetHomeRequest(GetHomeRequest event, Emitter<ManageHomeState> emit) async {
    emit(state.copyWith(newGetStatus: HomeGetLoading()));

    final allAdverts = await repository.getAllAdverts();
    final hotAdverts = await repository.getHotAdverts();

    allAdverts.fold(
      (error) => emit(state.copyWith(newGetStatus: HomeGetError(error))),
      (allAdvertsData) {
        hotAdverts.fold(
          (error) => emit(state.copyWith(newGetStatus: HomeGetError(error))),
          (hotAdvertsdata) {
            emit(state.copyWith(
                newGetStatus: HomeGetSuccess(
              allAdverts: allAdvertsData,
              hotAdverts: hotAdvertsdata,
            )));
          },
        );
      },
    );
  }
}
