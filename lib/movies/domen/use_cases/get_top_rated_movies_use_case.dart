import 'package:clean_archeticture_movies/movies/domen/entities/move.dart';
import 'package:clean_archeticture_movies/movies/domen/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';
import '../../../core/usecase/base_usecase.dart';

class GetTopRatedMoviesUseCase extends BaseUserCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getTopRateMovies();
  }
}
