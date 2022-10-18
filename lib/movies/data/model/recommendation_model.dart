import 'package:clean_archeticture_movies/movies/domen/entities/recommendation.dart';

class RecomendationModel extends Recommendation {
  RecomendationModel({
    super.backdropPath,
    required super.id,
  });
  factory RecomendationModel.fromjson(Map<String, dynamic> json) =>
      RecomendationModel(
        backdropPath:
            json["backdrop_path"] ?? "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
        id: json["id"],
      );
}
