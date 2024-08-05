import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unikit/ui/news_screen/messager_post.dart';

import '../../model/search.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MessageFetcher messageFetcher;

  SearchBloc(this.messageFetcher) : super(SearchInactive()) {
    on<SearchStarted>((event, emit) => emit(const SearchActive("", [])));
    on<SearchQueryChanged>((event, emit) {
      final results = _search(event.query);
      emit(SearchActive(event.query, results));
    });
    on<SearchEnded>((event, emit) => emit(SearchInactive()));
  }

  List<Search> _search(String query) {
    final allSearchResults = messageFetcher.listSearch;
    final lowerCaseQuery = query.toLowerCase();
    final regex = RegExp(lowerCaseQuery);
    if (query.isNotEmpty) {
      return allSearchResults.where((search) {
        final description = search.description?.toLowerCase() ?? '';
        return regex.hasMatch(description);
      }).toList();
    } else {
      return List.empty();
    }
  }
}
