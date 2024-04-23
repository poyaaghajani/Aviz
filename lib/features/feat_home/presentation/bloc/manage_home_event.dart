part of 'manage_home_bloc.dart';

sealed class ManageHomeEvent extends Equatable {
  const ManageHomeEvent();
}

final class GetHomeRequest extends ManageHomeEvent {
  @override
  List<Object> get props => [];
}
