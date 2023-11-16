import 'package:filmpedia/core/server_exception.dart';
import 'package:filmpedia/data/datasources/movie_remote_datasources.dart';
import 'package:filmpedia/data/datasources/remote/movie_remote_datasources_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'movie_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDatasourceImpl(client: mockHttpClient);
  });

  const query = 'Avengers';
  const tUrlPopularMovie = 'https://api.themoviedb.org/3/movie/popular?api_key=ce1bd196d7cff71059a47df8217ed6ac';
  const tUrlTrendingMovie = 'https://api.themoviedb.org/3/trending/movie/day?api_key=ce1bd196d7cff71059a47df8217ed6ac';
  const sUrl = 'https://api.themoviedb.org/3/search/movie?api_key=ce1bd196d7cff71059a47df8217ed6ac&query=$query';

  test("should perform GET request on a url to get trending movies", () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(tUrlTrendingMovie)))
        .thenAnswer((_) async => http.Response('{"results": []}', 200));

    //act
    await dataSource.getTrendingMovies();

    //assert

    verify(mockHttpClient.get(Uri.parse(tUrlTrendingMovie)));
  });

  test("should throw ServerException when the response code 404", () async {
    //arrange
    when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response('Something went wrong', 404));

    //act
    final call = dataSource.getTrendingMovies;

    //assert
    expect(() => call(), throwsA(isA<ServerExecption>()));
  });

  test("should perform GET request on a url to get popular movies", () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(tUrlPopularMovie)))
        .thenAnswer((_) async => http.Response('{"results": []}', 200));

    //act
    await dataSource.getPopularMovies();

    //assert

    verify(mockHttpClient.get(Uri.parse(tUrlPopularMovie)));
  });

  test("should throw ServerException when the response code 404", () async {
    //arrange
    when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response('Something went wrong', 404));

    //act
    final call = dataSource.getPopularMovies;

    //assert
    expect(() => call(), throwsA(isA<ServerExecption>()));
  });

  test("should perform GET request on a url to search movie", () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(sUrl))).thenAnswer((_) async => http.Response('{"results": []}', 200));

    //act
    await dataSource.searchMovies(query);

    //assert

    verify(mockHttpClient.get(Uri.parse(sUrl)));
  });

  test("should throw ServerException when the response code 404 for search movies", () async {
    //arrange
    when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response('Something went wrong', 404));

    //act
    final call = dataSource.searchMovies;

    //assert
    expect(() => call(query), throwsA(isA<ServerExecption>()));
  });
}
