part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object?> get props => [];
}

class SearchInactive extends SearchState {}

class SearchActive extends SearchState {
  final String query;
  final List<Search> results;

  const SearchActive(this.query, this.results);

  @override
  List<Object?> get props => [query, results];
}

