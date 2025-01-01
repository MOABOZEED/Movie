import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/exeptions.dart';
import 'package:movie/core/network/api_const.dart';
import 'package:movie/core/network/error_massege.dart';
import 'package:movie/movies_module/data/model/movie_model.dart';
import 'package:movie/movies_module/data/model/popular_movie_model.dart';

import '../../../core/error/failure.dart';
import '../../domian/entity/movie_entites.dart';
import '../../domian/entity/popular_movie_entity.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failure ,List<MovieModel>>> getNowPlayingMovie();

  Future<Either<Failure ,List<MovieModel>>> getPopularMovie();

  Future<Either<Failure ,List<MovieModel>>> getTopMovie();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<Either<Failure ,List<MovieModel>>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConst.nowPlayingPath);
    if (response.statusCode == 200) {
      // print(response.data);
      return  Right(List<MovieModel>.from(
        (response.data["results"] as List).map(
              (e) => MovieModel.fromJson(e),
        ),

      ),);

    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
      // response.data
    }
  }

  @override
  Future<Either<Failure ,List<MovieModel>>> getPopularMovie() async {
    final response = await Dio().get(ApiConst.nowPopularPath);
    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(
        (response.data["results"] as List).map(
              (e) => MovieModel.fromJson(e),
        ),
      ));
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
      // response.data
    }
  }

  @override
  Future<Either<Failure ,List<MovieModel>>> getTopMovie() async {
    final response = await Dio().get(ApiConst.nowTopRatedPath);
    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(
        (response.data["results"] as List).map(
              (e) => MovieModel.fromJson(e),
        ),
      ),
      );
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
      // response.data
    }
  }
}
