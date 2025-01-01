import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies_module/domian/entity/popular_movie_entity.dart';

import '../../domian/entity/movie_entites.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final List<Movie> popularMovieEntity;
  final List<Movie> topRate;
  final RequestEnum requestState;

  final String message;

  const MovieState({
    this.topRate = const [],
    this.popularMovieEntity = const [],
    this.nowPlayingMovie = const [],
    this.requestState = RequestEnum.loading,
    this.message = '',
  });

  @override
  List<Object> get props =>
      [nowPlayingMovie, popularMovieEntity, requestState, message,topRate];

  MovieState copyWith({
    List<Movie>?topRate,
    List<Movie>? nowPlayingMovie,
    List<Movie>? popularMovieEntity,
    RequestEnum? requestState,
    String? message,
  }) {
    return MovieState(
      topRate: topRate??this.topRate,
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      popularMovieEntity: popularMovieEntity ?? this.popularMovieEntity,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
    );
  }
}
