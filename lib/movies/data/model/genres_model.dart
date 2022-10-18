import 'package:clean_archeticture_movies/movies/domen/entities/genres.dart';

class GenresModel extends Genres {
  GenresModel({
    required super.id,
    required super.name,
  });
  factory GenresModel.fromjson(Map<String, dynamic> json) => GenresModel(
        id: json["id"],
        name: json["name"],
      );
}
