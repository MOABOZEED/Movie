import 'package:dartz/dartz.dart';
import 'package:movie/movies_module/domian/entity/movie_entites.dart';

import '../../../core/error/failure.dart';
import '../entity/popular_movie_entity.dart';

abstract class BaseMovieRepository{

  Future<Either<Failure ,List<Movie>>> getNowPlaying();
  Future<Either<Failure ,List<Movie>>>getPopularMovie();
  Future<Either<Failure ,List<Movie>>>getTopMovie();

}