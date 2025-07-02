import '../../data/list_movie_model.dart';

class PopularStates {}

class PopularInitailState extends PopularStates {}

class PopularLoadingState extends PopularStates {}

class PopularSuccessState extends PopularStates {
  final MovieListResponse movieListResponse;
  PopularSuccessState ({required this.movieListResponse});

}

class PopularErrorState extends PopularStates {
  final String em;
  PopularErrorState({required this.em});
}