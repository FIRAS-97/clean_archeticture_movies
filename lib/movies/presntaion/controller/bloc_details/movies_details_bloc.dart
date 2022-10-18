import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_archeticture_movies/core/utiles/enums.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/movies_details.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_recommendation.dart';
import 'package:equatable/equatable.dart';

import '../../../domen/entities/recommendation.dart';
import '../../../domen/use_cases/get_movies_details_use_case.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMoviesDetailsUseCase, this.getRecommendationUseCase)
      : super(MoviesDetailsState()) {
    on<GetMoviesDeatilsEvent>(_getMoviesDetails);
    on<GetMoviesRecomendation>(_getMoviesRecomendation);
  }
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMoviesDetails(
      GetMoviesDeatilsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result = await getMoviesDetailsUseCase(
        MoviesDetailParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            moviesDetailsState: RequestState.erorr,
            moviesDetailsmeesage: l.message)),
        (r) => emit(
              state.copyWith(
                  moviesDetailsState: RequestState.loaded, moviesDetails: r),
            ));
  }

  FutureOr<void> _getMoviesRecomendation(
      GetMoviesRecomendation event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParametrs(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            moviesRecomendationState: RequestState.erorr,
            moviesRecomendationsmeesage: l.message)),
        (r) => emit(
              state.copyWith(
                  moviesRecomendationState: RequestState.loaded,
                  moviesRecomendation: r),
            ));
  }
}
