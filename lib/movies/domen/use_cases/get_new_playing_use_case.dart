import 'package:clean_archeticture_movies/core/usecase/base_usecase.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/move.dart';
import 'package:clean_archeticture_movies/movies/domen/repository/base_movies_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';

class GetNewPlayingMoviesUseCase
    extends BaseUserCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNewPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
