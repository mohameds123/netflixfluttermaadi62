class NowPlayingStates {}

class NowPlayingInitailState extends NowPlayingStates {}

class NowPlayingLoadingState extends NowPlayingStates {}

class NowPlayingSuccessState extends NowPlayingStates {}

class NowPlayingErrorState extends NowPlayingStates {
  final String em;
  NowPlayingErrorState({required this.em});
}