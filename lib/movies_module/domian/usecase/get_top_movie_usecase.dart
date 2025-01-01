import 'package:dartz/dartz.dart';
import 'package:movie/movies_module/domian/entity/movie_entites.dart';
import 'package:movie/movies_module/domian/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetTopMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopMovieUseCase(this.baseMovieRepository);

  Future<Either<Failure ,List<Movie>>> execute() async {
    return await baseMovieRepository.getTopMovie();
  }
}
