import 'package:clean_archeticture_movies/movies/domen/entities/move.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_movies_details_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';
import '../entities/movies_details.dart';
import '../entities/recommendation.dart';
import '../use_cases/get_recommendation.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRateMovies();
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MoviesDetailParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParametrs parametrs);
}
// هون عندي 3 معادلات كرمال جيب ال -
//api منون
// للصفحة الاولى 