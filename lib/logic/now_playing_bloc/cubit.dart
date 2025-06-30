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
    emit(NowPlayingLoadingState());
    try {
      /// GET DATA
      final response = await dio.get(ApiUrl.nowPlayingUrl);
      if (response.statusCode == 200) {
        final x = MovieListResponse.fromJson(response.data);
        emit(NowPlayingSuccessState(movieListResponse: x));
      }
    } catch (e) {
      emit(NowPlayingErrorState(em: e.toString()));
    }
  }
}
