part of 'manage_home_bloc.dart';

class ManageHomeState extends Equatable {
  final HomeGetStatus getStatus;

  const ManageHomeState({
    required this.getStatus,
  });

  ManageHomeState copyWith({
    HomeGetStatus? newGetStatus,
  }) {
    return ManageHomeState(
      getStatus: newGetStatus ?? getStatus,
    );
  }

  @override
  List<Object> get props => [getStatus];
}
