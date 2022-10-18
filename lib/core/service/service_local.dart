import 'package:clean_archeticture_movies/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_archeticture_movies/movies/data/repository/movies_repository.dart';
import 'package:clean_archeticture_movies/movies/domen/repository/base_movies_repository.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_movies_details_use_case.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_popular_movies_use_case.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_recommendation.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_top_rated_movies_use_case.dart';
import 'package:clean_archeticture_movies/movies/presntaion/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movies/domen/use_cases/get_new_playing_use_case.dart';
import '../../movies/presntaion/controller/bloc_details/movies_details_bloc.dart';


final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    sl.registerLazySingleton(() => GetNewPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
  }
}
