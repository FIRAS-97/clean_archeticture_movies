import 'package:clean_archeticture_movies/core/failure.dart';
import 'package:clean_archeticture_movies/core/usecase/base_usecase.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/movies_details.dart';
import 'package:clean_archeticture_movies/movies/domen/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMoviesDetailsUseCase
    extends BaseUserCase<MoviesDetails, MoviesDetailParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesDetails>> call(
      MoviesDetailParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }
}

class MoviesDetailParameters extends Equatable {
  final int movieId;

  MoviesDetailParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
