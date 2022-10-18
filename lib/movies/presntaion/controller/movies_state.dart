import 'package:clean_archeticture_movies/core/utiles/enums.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/move.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingmessage;
  final List<Movie> nowPopularMovies;
  final RequestState nowPopularState;
  final String nowpopularmessage;
  final List<Movie> nowTopRateMovies;
  final RequestState nowTopRateState;
  final String nowTopRatemessage;
  MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingmessage = '',
      this.nowPopularMovies = const [],
      this.nowPopularState = RequestState.loading,
      this.nowpopularmessage = '',
      this.nowTopRateMovies = const [],
      this.nowTopRateState = RequestState.loading,
      this.nowTopRatemessage = ''});
  MoviesState copywith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingmessage,
    List<Movie>? nowPopularMovies,
    RequestState? nowPopularState,
    String? nowpopularmessage,
    List<Movie>? nowTopRateMovies,
    RequestState? nowTopRateState,
    String? nowTopRatemessage,
  }) {
    return MoviesState(
        // ?? mean if nowPlayingMovies==null asgiment value from object
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingmessage: nowPlayingmessage ?? this.nowPlayingmessage,
        nowPopularMovies: nowPopularMovies ?? this.nowPopularMovies,
        nowPopularState: nowPopularState ?? this.nowPopularState,
        nowpopularmessage: nowpopularmessage ?? this.nowpopularmessage,
        nowTopRateMovies: nowTopRateMovies ?? this.nowTopRateMovies,
        nowTopRateState: nowTopRateState ?? this.nowTopRateState,
        nowTopRatemessage: nowTopRatemessage ?? this.nowTopRatemessage);
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingmessage,
        nowPopularMovies,
        nowPopularState,
        nowpopularmessage,
        nowTopRateMovies,
        nowTopRateState,
        nowTopRatemessage,
      ];
}
