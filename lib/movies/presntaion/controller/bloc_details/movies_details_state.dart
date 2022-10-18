part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetails? moviesDetails;
  final RequestState moviesDetailsState;
  final String moviesDetailsmeesage;
  final List<Recommendation>? moviesRecomendation;
  final RequestState moviesRecomendationState;
  final String moviesRecomendationsmeesage;
  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestState? moviesDetailsState,
    String? moviesDetailsmeesage,
    List<Recommendation>? moviesRecomendation,
    RequestState? moviesRecomendationState,
    String? moviesRecomendationsmeesage,
  }) {
    return MoviesDetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesDetailsmeesage: moviesDetailsmeesage ?? this.moviesDetailsmeesage,
      moviesRecomendation: moviesRecomendation ?? this.moviesRecomendation,
      moviesRecomendationState:
          moviesRecomendationState ?? this.moviesRecomendationState,
      moviesRecomendationsmeesage:
          moviesRecomendationsmeesage ?? this.moviesRecomendationsmeesage,
    );
  }

  const MoviesDetailsState({
    this.moviesDetails,
    this.moviesDetailsState = RequestState.loading,
    this.moviesDetailsmeesage = "",
    this.moviesRecomendation = const [],
    this.moviesRecomendationState = RequestState.loading,
    this.moviesRecomendationsmeesage = "",
  });

  @override
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsState,
        moviesDetailsmeesage,
        moviesRecomendation,
        moviesRecomendationState,
        moviesRecomendationsmeesage,
      ];
}
