import 'package:clean_archeticture_movies/core/error/exception.dart';
import 'package:clean_archeticture_movies/core/failure.dart';
import 'package:clean_archeticture_movies/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/move.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/movies_details.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/recommendation.dart';
import 'package:clean_archeticture_movies/movies/domen/repository/base_movies_repository.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_movies_details_use_case.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_recommendation.dart';
import 'package:dartz/dartz.dart';

// قال انا هون بتعامل مع الداتا سورس و بس باخد المعادلات من الدومين
class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result =
        await baseMoviesRemoteDataSource.getNewPlayingMoviesUseCase();

    try {
      return Right(result);
    } on serverException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMoviesUseCase();

    try {
      return Right(result);
    } on serverException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRateMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMoviesUseCase();

    try {
      return Right(result);
    } on serverException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MoviesDetailParameters parameters) async {
    final result =
        await baseMoviesRemoteDataSource.MoviesDetailUseCase(parameters);

    try {
      return Right(result);
    } on serverException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParametrs parametrs) async {
    final result =
        await baseMoviesRemoteDataSource.getRecommendation(parametrs);

    try {
      return Right(result);
    } on serverException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
