// Mocks generated by Mockito 5.4.2 from annotations
// in filmpedia/test/data/repositories/movie_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:filmpedia/data/datasources/movie_remote_datasources.dart'
    as _i2;
import 'package:filmpedia/data/models/movie.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i2.MovieRemoteDataSource {
  @override
  _i3.Future<List<_i4.MovieModel>> getTrendingMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTrendingMovies,
          [],
        ),
        returnValue: _i3.Future<List<_i4.MovieModel>>.value(<_i4.MovieModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.MovieModel>>.value(<_i4.MovieModel>[]),
      ) as _i3.Future<List<_i4.MovieModel>>);

  @override
  _i3.Future<List<_i4.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i3.Future<List<_i4.MovieModel>>.value(<_i4.MovieModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.MovieModel>>.value(<_i4.MovieModel>[]),
      ) as _i3.Future<List<_i4.MovieModel>>);

  @override
  _i3.Future<List<_i4.MovieModel>> searchMovies(String? queryMovie) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [queryMovie],
        ),
        returnValue: _i3.Future<List<_i4.MovieModel>>.value(<_i4.MovieModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.MovieModel>>.value(<_i4.MovieModel>[]),
      ) as _i3.Future<List<_i4.MovieModel>>);
}