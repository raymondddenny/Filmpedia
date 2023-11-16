abstract class SearchMoviesEvent {}

class GetSearchMovies extends SearchMoviesEvent {
  final String query;

  GetSearchMovies({required this.query});
}
