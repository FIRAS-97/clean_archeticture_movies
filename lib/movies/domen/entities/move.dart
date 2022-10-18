import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String overview;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final double voteAverage;
  final String releaseDate;

  const Movie(
      {required this.releaseDate,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.overview,
      required this.voteAverage,
      required this.title});

  @override
  List<Object?> get props =>
      [title, overview, backdropPath, genreIds, id, voteAverage, releaseDate];
}
