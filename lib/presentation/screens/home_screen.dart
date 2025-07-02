import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixfluttermaadi62/core/utils/colors.dart';
import 'package:netflixfluttermaadi62/core/utils/txt.dart';
import 'package:netflixfluttermaadi62/logic/now_playing_bloc/cubit.dart';
import 'package:netflixfluttermaadi62/presentation/widgets/now_playing_widget.dart';
import 'package:netflixfluttermaadi62/presentation/widgets/popular_widget.dart';
import 'package:netflixfluttermaadi62/presentation/widgets/top_rated_widget.dart';

import '../../logic/popular_bloc/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NowPlayingCubit()..getNowPlayingMovie()),
        BlocProvider(create: (context)=>PopularCubit()..getPopularMovie()),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NowPlayingWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(Txt.popular,
                style: TextStyle(
                  fontSize: 20,
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w700,
                ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              PopularWidget(),
              SizedBox(
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(Txt.topRated,
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsManager.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
          
              TopRatedWidget(),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
