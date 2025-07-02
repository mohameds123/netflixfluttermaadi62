import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:netflixfluttermaadi62/logic/popular_bloc/cubit.dart';
import 'package:netflixfluttermaadi62/logic/popular_bloc/state.dart';

import '../../core/const/images_paths.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularStates>(

      builder: (context, state) {
        if (state is PopularLoadingState){
          return Center(child: Lottie.asset('assets/animations/loading_animation.json',width: 100,height: 100));

        }else if (state is PopularSuccessState){
          return SizedBox(
            height: 168,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movieListResponse.results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                      child: Image.network("https://image.tmdb.org/t/p/original${state.movieListResponse.results[index].posterPath}")),
                );
              },
            ),
          );
        }else if (state is PopularErrorState){
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
