part of 'manage_search_bloc.dart';

class ManageSearchState extends Equatable {
  final SearchGetStatus getStatus;

  const ManageSearchState({
    required this.getStatus,
  });

  ManageSearchState copyWith({
    SearchGetStatus? newGetStatus,
  }) {
    return ManageSearchState(
      getStatus: newGetStatus ?? getStatus,
    );
  }

  @override
  List<Object> get props => [getStatus];
}
