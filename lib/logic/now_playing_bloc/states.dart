import '../../data/list_movie_model.dart';

class NowPlayingStates {}

class NowPlayingInitailState extends NowPlayingStates {}

class NowPlayingLoadingState extends NowPlayingStates {}

class NowPlayingSuccessState extends NowPlayingStates {
  final MovieListResponse movieListResponse;
  NowPlayingSuccessState ({required this.movieListResponse});

}

class NowPlayingErrorState extends NowPlayingStates {
  final String em;
  NowPlayingErrorState({required this.em});
}