import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixfluttermaadi62/core/api/api_url.dart';
import 'package:netflixfluttermaadi62/logic/now_playing_bloc/states.dart';

import '../../data/list_movie_model.dart';

class NowPlayingCubit extends Cubit<NowPlayingStates> {
  NowPlayingCubit() : super(NowPlayingInitailState());

  final dio = Dio();

  ///
  Future getNowPlayingMovie() async {
    print("1");
    emit(NowPlayingLoadingState());
    try {

      print("2");

      /// GET DATA
      final response = await dio.get(ApiUrl.nowPlayingUrl);
      print(response);
      if (response.statusCode == 200) {
        print("3");

        final x = MovieListResponse.fromJson(response.data);
        emit(NowPlayingSuccessState(movieListResponse: x));
        print("4");

      }
    } catch (e) {
      emit(NowPlayingErrorState(em: e.toString()));
      print("========= Now Playing Error$e");
    }
  }
}
