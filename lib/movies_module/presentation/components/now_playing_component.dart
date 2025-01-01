import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movies_module/presentation/controller/movie_bloc.dart';
import 'package:movie/movies_module/presentation/controller/movie_state.dart';

import '../../../core/network/api_const.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc,MovieState>(builder: (context, state) =>  FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: state.nowPlayingMovie.map(
              (item) {
            return GestureDetector(
              key: const Key('openMovieMinimalDetail'),
              onTap: () {
                /// TODO : NAVIGATE TO MOVIE DETAILS
              },
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // fromLTRB
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0, 0.3, 0.5, 1],
                      ).createShader(
                        Rect.fromLTRB(
                            0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      height: 560.0,
                      imageUrl: ApiConst.imageUrl(
                          "${item.backdropPath}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.redAccent,
                                size: 16.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                'Now Playing'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    ),
    );
  }
}