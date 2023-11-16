import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_trending_movies.dart';
import 'trending_movies_event.dart';
import 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies}) : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final result = await getTrendingMovies();

      result.fold(
        (failure) => emit(TrendingMoviesError(message: failure.toString())),
        (success) => emit(TrendingMoviesLoaded(movies: success)),
      );
    });
  }
}
