import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_popular_movies.dart';
import 'popular_movies_event.dart';
import 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopulargMovies;

  PopularMoviesBloc({required this.getPopulargMovies}) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final result = await getPopulargMovies();

      result.fold(
        (failure) => emit(PopularMoviesError(message: failure.toString())),
        (success) => emit(PopularMoviesLoaded(movies: success)),
      );
    });
  }
}
