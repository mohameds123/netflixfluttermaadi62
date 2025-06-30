import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixfluttermaadi62/core/api/api_url.dart';
import 'package:netflixfluttermaadi62/logic/now_playing_bloc/states.dart';

class NowPlayingCubit extends Cubit <NowPlayingStates> {
  NowPlayingCubit () : super (NowPlayingInitailState());

  final dio = Dio();
  
  /// 
  Future getNowPlayingMovie () async {
    emit(NowPlayingLoadingState());
    try{
      dio.get(ApiUrl.nowPlayingUrl);
    }catch (e){
      emit(NowPlayingErrorState(em: e.toString()));
    }
    
  }

}