import 'package:clean_archeticture_movies/core/usecase/base_usecase.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/move.dart';
import 'package:clean_archeticture_movies/movies/domen/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';

class GetPopularMoviesUseCase extends BaseUserCase<List<Movie>,NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
