part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();
}

class GetMoviesDeatilsEvent extends MoviesDetailsEvent {
  final int id;

  GetMoviesDeatilsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMoviesRecomendation extends MoviesDetailsEvent {
  final int id;

  GetMoviesRecomendation(this.id);

  @override
  List<Object?> get props => [id];
}
