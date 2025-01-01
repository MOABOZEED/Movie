import 'package:dartz/dartz.dart';
import 'package:movie/movies_module/domian/entity/movie_entites.dart';

import '../../../core/error/failure.dart';
import '../repository/base_movie_repository.dart';

class GetNowPlayingUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingUseCase(this.baseMovieRepository);

  Future<Either<Failure ,List<Movie>>> execute()async{
    return await baseMovieRepository.getNowPlaying();
  }
}