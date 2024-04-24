part of 'manage_home_bloc.dart';

sealed class ManageHomeEvent extends Equatable {
  const ManageHomeEvent();
}

final class GetHomeRequest extends ManageHomeEvent {
  final int page;
  const GetHomeRequest({required this.page});

  @override
  List<Object> get props => [page];
}
