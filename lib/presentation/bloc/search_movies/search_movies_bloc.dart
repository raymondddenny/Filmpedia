import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/search_movies.dart';
import 'search_movies_event.dart';
import 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;

  SearchMoviesBloc({required this.searchMovies}) : super(SearchMoviesInitial()) {
    on<GetSearchMovies>((event, emit) async {
      emit(SearchMoviesLoading());
      final result = await searchMovies(event.query);

      result.fold(
        (failure) => emit(SearchMoviesError(message: failure.toString())),
        (success) => emit(SearchMoviesLoaded(movies: success)),
      );
    });
  }
}
