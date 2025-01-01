import 'package:dartz/dartz.dart';
import 'package:movie/movies_module/domian/entity/movie_entites.dart';
import 'package:movie/movies_module/domian/entity/popular_movie_entity.dart';

import '../../../core/error/failure.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase(this.baseMovieRepository);

  Future<Either<Failure ,List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovie();
  }
}
