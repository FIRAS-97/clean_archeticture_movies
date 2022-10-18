import 'package:clean_archeticture_movies/movies/domen/entities/move.dart';

class MoveModel extends Movie {
  MoveModel({
    required super.releaseDate,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.voteAverage,
    required super.title,
  });
  factory MoveModel.fromJson(Map<String, dynamic> json) => MoveModel(
      releaseDate: json["release_date"],
      backdropPath: json["backdrop_path"],
      genreIds: List.from(json["genre_ids"].map((e) => e)),
      id: json["id"],
      overview: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      title: json["title"]);
}
