import 'package:dartz/dartz.dart';
import 'package:filmpedia/domain/entities/movie.dart';
import 'package:filmpedia/domain/repositories/movie_repository.dart';
import 'package:filmpedia/domain/usecases/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late MovieRepository movieRepository;
  late SearchMovies usecase;

  setUp(() {
    movieRepository = MockMovieRepository();
    usecase = SearchMovies(movieRepository: movieRepository);
  });

  const tQuery = 'God\'s not dead';

  final tMovies = [
    const Movie(
      id: 1,
      title: 'God\'s not dead',
      overview: 'This is movie 1 overview',
      posterPath: '/image1.jpg',
    ),
    const Movie(
      id: 2,
      title: 'God\'s not dead 2',
      overview: 'This is movie 2 overview',
      posterPath: '/image2.jpg',
    ),
  ];

  test('should get searched movies from the movie repository', () async {
    when(movieRepository.searchMovies(tQuery)).thenAnswer((_) async => Right(tMovies));

    //act
    final result = await usecase(tQuery);

    //assert
    expect(result, Right(tMovies));
    verify(movieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(movieRepository);
  });
}
