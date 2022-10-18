import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_archeticture_movies/core/usecase/base_usecase.dart';
import 'package:clean_archeticture_movies/core/utiles/enums.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_popular_movies_use_case.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_top_rated_movies_use_case.dart';
import 'package:clean_archeticture_movies/movies/presntaion/controller/movies_event.dart';
import 'package:clean_archeticture_movies/movies/presntaion/controller/movies_state.dart';
import '../../domen/use_cases/get_new_playing_use_case.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNewPlayingMoviesUseCase getNewPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNewPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(MoviesState()) {
    // ايمت هي يلي بتغير الستات تبع الصفجة من ستات ل ستات لما بجيب البيانات و بصيرو بقب البلوك فهون انا بغير حالة الصفجة بال يو اي باستخدام ال ايمت

    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRateMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    // emit(MoviesState(nowPlayingState: RequestState.loaded));
    final result = await getNewPlayingMoviesUseCase(NoParameters());
    result.fold(
      (l) => emit(state.copywith(
          nowPlayingState: RequestState.erorr, nowPlayingmessage: l.message)),
      (r) => emit(
        state.copywith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(NoParameters());
    result.fold(
      (l) => emit(state.copywith(
          nowPopularState: RequestState.erorr, nowpopularmessage: l.message)),
      (r) => emit(
        state.copywith(
          nowPopularState: RequestState.loaded,
          nowPopularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRateMovies(
      GetTopRatedEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(NoParameters());
    result.fold(
      (l) => emit(state.copywith(
          nowTopRateState: RequestState.erorr, nowTopRatemessage: l.message)),
      (r) => emit(
        state.copywith(
          nowTopRateState: RequestState.loaded,
          nowTopRateMovies: r,
        ),
      ),
    );
  }
}
// in copyWith iam not create new object from MoviesState 
// وبالتالي انا بتعامل مع اوبجكت واحد في 
// MoviesState 
