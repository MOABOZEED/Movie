import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final dynamic popularity;
  final String title;
  final String overview;
  final List<int> gendreIds;
  final double voteAverage;
  final String releaseDate;
  final String? posterPath;
  final String? backdropPath;

  const Movie({
    required this.id,
     this.popularity,
    required this.title,
    required this.overview,
    required this.gendreIds,
    required this.voteAverage,
    required this.releaseDate,
     this.posterPath,
    required this.backdropPath,

  });

  @override
  List<Object> get props => [
        id,
        popularity,
        title,
        overview,
        gendreIds,
        voteAverage,
        releaseDate,
      ];
}
