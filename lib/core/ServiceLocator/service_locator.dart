import 'package:get_it/get_it.dart';
import 'package:movie/movies_module/data/datasource/movie_remote_datasource.dart';
import 'package:movie/movies_module/data/model/movie_model.dart';
import 'package:movie/movies_module/data/repository/movies_repository.dart';
import 'package:movie/movies_module/domian/usecase/get_now_playing_usecase.dart';
import 'package:movie/movies_module/domian/usecase/get_popular_movie_usecase.dart';
import 'package:movie/movies_module/presentation/controller/movie_bloc.dart';
import 'package:movie/movies_module/presentation/controller/movie_event.dart';

import '../../movies_module/domian/repository/base_movie_repository.dart';
import '../../movies_module/domian/usecase/get_top_movie_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init() {
    //Bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()),);
    //Data Source

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    //Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()),);
    //UseCase
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()),);
    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()),);
    sl.registerLazySingleton(() => GetTopMovieUseCase(sl()),);

  }

}


List<MovieModel> moviemodel =[

];