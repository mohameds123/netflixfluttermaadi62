import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixfluttermaadi62/core/api/api_url.dart';
import 'package:netflixfluttermaadi62/logic/now_playing_bloc/states.dart';
import 'package:netflixfluttermaadi62/logic/popular_bloc/state.dart';

import '../../data/list_movie_model.dart';

class PopularCubit extends Cubit<PopularStates> {
  PopularCubit() : super(PopularInitailState());

  final dio = Dio();

  ///
  Future getPopularMovie() async {
    print("1");
    emit(PopularLoadingState());
    try {

      print("2");

      /// GET DATA
      final response = await dio.get(ApiUrl.popularUrl);
      print(response);
      if (response.statusCode == 200) {
        print("3");

        final x = MovieListResponse.fromJson(response.data);
        emit(PopularSuccessState(movieListResponse: x));
        print("4");

      }
    } catch (e) {
      emit(PopularErrorState(em: e.toString()));
      print("========= Now Playing Error$e");
    }
  }
}
