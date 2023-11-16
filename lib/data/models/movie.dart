import 'package:filmpedia/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') required String posterPath,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  const MovieModel._();

  // convert to movie entity
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
    );
  }
}
