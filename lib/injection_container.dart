import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/movie_remote_datasources.dart';
import 'data/datasources/remote/movie_remote_datasources_impl.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_popular_movies.dart';
import 'domain/usecases/get_trending_movies.dart';
import 'presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'presentation/bloc/search_movies/search_movies_bloc.dart';
import 'presentation/bloc/search_movies/search_movies_event.dart';
import 'presentation/bloc/trending_movies/trending_movies_bloc.dart';

final getIt = GetIt.instance;

void init() {
  //BLOC
  getIt.registerFactory(() => PopularMoviesBloc(getPopulargMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

  //USE CASE

  getIt.registerLazySingleton(() => GetPopularMovies(movieRepository: getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(movieRepository: getIt()));
  getIt.registerLazySingleton(() => GetSearchMovies(query: getIt()));

  //REPOSITORY
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDatasource: getIt()));

  //DATA SOURCES
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDatasourceImpl(client: getIt()));

  //HTTP Service
  getIt.registerLazySingleton(() => http.Client());
}
