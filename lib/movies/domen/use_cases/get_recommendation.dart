import 'package:clean_archeticture_movies/core/failure.dart';
import 'package:clean_archeticture_movies/core/usecase/base_usecase.dart';
import 'package:clean_archeticture_movies/movies/domen/entities/recommendation.dart';
import 'package:clean_archeticture_movies/movies/domen/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationUseCase
    extends BaseUserCase<List<Recommendation>, RecommendationParametrs> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParametrs parameters) async {
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}

class RecommendationParametrs extends Equatable {
  final int id;

 const RecommendationParametrs(this.id);

  @override
  List<Object?> get props => [id];
}
