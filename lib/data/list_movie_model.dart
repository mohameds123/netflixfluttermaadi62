import 'movie_model.dart';

class MovieListResponse {
  // final String maximumDate;
  // final String minimumDate;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieListResponse({
    // required this.maximumDate,
    // required this.minimumDate,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      // maximumDate: json['dates']['maximum'],
      // minimumDate: json['dates']['minimum'],
      page: json['page'],
      results: (json['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
