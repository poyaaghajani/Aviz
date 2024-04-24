part of 'manage_search_bloc.dart';

sealed class ManageSearchEvent extends Equatable {
  const ManageSearchEvent();
}

final class SearchGetRequest extends ManageSearchEvent {
  final String query;
  final int page;
  final bool needRefresh;

  const SearchGetRequest({
    required this.query,
    required this.page,
    this.needRefresh = true,
  });

  @override
  List<Object> get props => [query, page, needRefresh];
}
