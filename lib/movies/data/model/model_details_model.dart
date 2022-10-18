import 'package:clean_archeticture_movies/movies/data/model/genres_model.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  MoviesDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });
  factory MoviesDetailsModel.fromjson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        genres: List<GenresModel>.from(
            json["genres"].map((e) => GenresModel.fromjson(e))),
        backdropPath: json["backdrop_path"],
        id: json["id"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        runTime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
