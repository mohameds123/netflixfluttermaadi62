import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:netflixfluttermaadi62/logic/now_playing_bloc/cubit.dart';
import 'package:netflixfluttermaadi62/logic/now_playing_bloc/states.dart';

import '../../core/const/images_paths.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/txt.dart';

class NowPlayingWidget extends StatelessWidget {

  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingStates>(
      builder: (context, state){
        if (state is NowPlayingLoadingState){
          return Center(child: Lottie.asset('assets/animations/loading_animation.json'));

      }else if (state is NowPlayingSuccessState) {
          return Stack(
            children: [
              SizedBox(
                height: 370,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movieListResponse.results.length,
                  itemBuilder: (context, index) {
                    return Image.network("https://image.tmdb.org/t/p/original${state.movieListResponse.results[index].posterPath}",
                        );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280, left: 90),
                child: Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: ColorsManager.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      Txt.nowPlaying,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }else if (state is NowPlayingErrorState){
          return Center(child: Text(state.em,style: TextStyle(color: Colors.white),));
        }else {
          return  Center(
            child: SvgPicture.asset(ImagesPaths.netflixLogo),
          );
        }
      },
    );
  }
}
