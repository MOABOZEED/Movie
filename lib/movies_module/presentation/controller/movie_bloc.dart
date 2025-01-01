import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies_module/domian/usecase/get_now_playing_usecase.dart';
import 'package:movie/movies_module/domian/usecase/get_popular_movie_usecase.dart';
import 'package:movie/movies_module/presentation/controller/movie_event.dart';
import 'package:movie/movies_module/presentation/controller/movie_state.dart';

import '../../domian/usecase/get_top_movie_usecase.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;

  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopMovieUseCase getTopMovieUseCase;

  MovieBloc(this.getNowPlayingUseCase, this.getPopularMovieUseCase,
      this.getTopMovieUseCase)
      : super(const MovieState()) {
    on<GetPopularMovie>((event, emit) async {
      final result = await getPopularMovieUseCase.execute();

      log("GetPopularMovie${result}");
      result.fold(
          (l) => emit(
                state.copyWith(
                    message: l.message, requestState: RequestEnum.error),
              ),
          (r) => emit(state.copyWith(
              nowPlayingMovie: r, requestState: RequestEnum.loaded)));
    });
    on<GetTopRate>((event, emit) async {
      final result = await getTopMovieUseCase.execute();
      result.fold(
        (l) => emit(state.copyWith(
          requestState: RequestEnum.error,
          message: l.message,
        )),
        (r) => emit(state.copyWith(
          requestState: RequestEnum.loaded,
          topRate: r,
        )),
      );
    });

    on<GetNowPlayingMovie>((event, emit) async {
      final result = await getNowPlayingUseCase.execute();

      result.fold(
        (l) => emit(state.copyWith(
            requestState: RequestEnum.error, message: l.message)),
        (r) => emit(state.copyWith(
            requestState: RequestEnum.loaded, popularMovieEntity: r)),
      );
    });
  }
}
