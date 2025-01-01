import 'package:movie/movies_module/domian/entity/movie_entites.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.popularity,
      required super.title,
      required super.overview,
      required super.gendreIds,
      required super.voteAverage,
      required super.releaseDate,
      required super.posterPath,
      required super.backdropPath,
      });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      posterPath: json['poster_path'],
      gendreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      popularity: json["popularity"],
      releaseDate: json["release_date"],
      overview: json["overview"],
      voteAverage: json["vote_average"],
      backdropPath: json["backdrop_path"],
    );
  }
//

}
