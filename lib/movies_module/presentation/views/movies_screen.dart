import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/movies_module/domian/usecase/get_now_playing_usecase.dart';
import 'package:movie/movies_module/presentation/controller/movie_bloc.dart';
import 'package:movie/movies_module/presentation/controller/movie_event.dart';
import 'package:movie/movies_module/presentation/controller/movie_state.dart';
import '../../../core/ServiceLocator/service_locator.dart';
import '../components/now_playing_component.dart';
import '../components/popular_component.dart';
import '../components/top_rate_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(sl<GetNowPlayingUseCase>.hashCode);
    print(sl<GetNowPlayingUseCase>.hashCode);
    return BlocProvider(
      // lazy: false,
      create: (BuildContext context) => sl<MovieBloc>()
        ..add(GetNowPlayingMovie())
        ..add(GetPopularMovie())
        ..add(GetTopRate()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          log(state.toString());
          log("${state.topRate}");

          return const Scaffold(
            // backgroundColor: Colors.grey[900],
            body: SingleChildScrollView(
              key: Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  NowPlayingComponent(),
                  PopularComponent(),
                  TopRateComponent(),
                  // SizedBox(height: 50.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
