import 'package:clean_archeticture_movies/core/error/exception.dart';
import 'package:clean_archeticture_movies/core/network/error_message_model.dart';
import 'package:clean_archeticture_movies/movies/data/model/model_details_model.dart';
import 'package:clean_archeticture_movies/movies/data/model/movies_model.dart';
import 'package:clean_archeticture_movies/movies/data/model/recommendation_model.dart';
import 'package:clean_archeticture_movies/movies/domen/use_cases/get_recommendation.dart';
import 'package:dio/dio.dart';

import '../../../core/utiles/constance.dart';
import '../../domen/use_cases/get_movies_details_use_case.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoveModel>> getNewPlayingMoviesUseCase();
  Future<List<MoveModel>> getPopularMoviesUseCase();
  Future<List<MoveModel>> getTopRatedMoviesUseCase();
  Future<MoviesDetailsModel> MoviesDetailUseCase(
      MoviesDetailParameters parameters);
  Future<List<RecomendationModel>> getRecommendation(
      RecommendationParametrs parametrs);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  Future<List<MoveModel>> getNewPlayingMoviesUseCase() async {
    final response = await Dio().get(
        "${Appconstance.baseUrl}/movie/now_playing?api_key=${Appconstance.apiKey}");
    if (response.statusCode == 200) {
      return List<MoveModel>.from(
          (response.data["results"] as List).map((e) => MoveModel.fromJson(e)));
    } else {
      throw serverException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<MoveModel>> getPopularMoviesUseCase() async {
    final response = await Dio().get(
        "${Appconstance.baseUrl}/movie/popular?api_key=${Appconstance.apiKey}");
    if (response.statusCode == 200) {
      return List<MoveModel>.from(
          (response.data["results"] as List).map((e) => MoveModel.fromJson(e)));
    } else {
      throw serverException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<MoveModel>> getTopRatedMoviesUseCase() async {
    final response = await Dio().get(
        "${Appconstance.baseUrl}/movie/top_rated?api_key=${Appconstance.apiKey}");
    if (response.statusCode == 200) {
      return List<MoveModel>.from(
          (response.data["results"] as List).map((e) => MoveModel.fromJson(e)));
    } else {
      throw serverException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<MoviesDetailsModel> MoviesDetailUseCase(
      MoviesDetailParameters parameters) async {
    final response =
        await Dio().get(Appconstance.baseUrlDetails(parameters.movieId));
    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromjson(response.data);
    } else {
      throw serverException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<RecomendationModel>> getRecommendation(
      RecommendationParametrs parametrs) async {
    final response =
        await Dio().get(Appconstance.baseUrlRecommendation(parametrs.id));
    if (response.statusCode == 200) {
      return List<RecomendationModel>.from((response.data["results"] as List)
          .map((e) => RecomendationModel.fromjson(e)));
    } else {
      throw serverException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
}
