import 'package:clean_archeticture_movies/movies/domen/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MoviesDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MoviesDetails({
    required this.genres,
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
  });
  @override
  List<Object?> get props => [
        genres,
        backdropPath,
        id,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage,
      ];
}
