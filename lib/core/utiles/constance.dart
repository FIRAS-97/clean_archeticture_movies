class Appconstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "cc84693890d2df40c7125c3b5a7166ba";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(path) => "$baseImageUrl$path";
  static String baseUrlDetails(int moveId) =>
      "$baseUrl/movie/$moveId?api_key=${apiKey}";
  static String baseUrlRecommendation(int recoId) =>
      "$baseUrl/movie/$recoId/recommendations?api_key=$apiKey";
}
