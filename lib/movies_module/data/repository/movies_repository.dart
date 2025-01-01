import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exeptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies_module/data/datasource/movie_remote_datasource.dart';
import 'package:movie/movies_module/domian/entity/movie_entites.dart';

import '../../domian/entity/popular_movie_entity.dart';
import '../../domian/repository/base_movie_repository.dart';
import '../model/movie_model.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;


  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    log("getNowPlaying${result}");

    try {
      Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMassageModel.statusMessage));
    }
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    log("getPopularMovie${result}");
    try {
      Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMassageModel.statusMessage));
    }
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopMovie() async {
    final result = await baseMovieRemoteDataSource.getTopMovie();
    try {
      Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMassageModel.statusMessage));
    }

    return result;
  }
}
