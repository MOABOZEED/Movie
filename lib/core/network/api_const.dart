class ApiConst {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "283f0b058d1f17d24ee9d53bdc92b3e9";
  static const nowPlayingPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const nowPopularPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const nowTopRatedPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
