import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/movies_module/presentation/controller/movie_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_const.dart';
import '../controller/movie_state.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) => Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : NAVIGATION TO POPULAR SCREEN
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('See More'),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.popularMovieEntity.length,
                itemBuilder: (context, index) {
                  // final movie = moviesList[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConst.imageUrl(
                              "${state.popularMovieEntity[index].backdropPath}"),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
