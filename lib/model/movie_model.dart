class MoviesResults {
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;

  MoviesResults({
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  MoviesResults.fromJson(Map<String, dynamic> json) {
    overview = json["overview"].toString();
    posterPath = json["poster_path"].toString();
    releaseDate = json["release_date"].toString();
    title = json["title"].toString();
  }
}

class Movies {
  List<dynamic>? results;

  Movies({
    this.results,
  });

  Movies.fromjson(Map<String, dynamic> json) {
    results = (json["results"] as List)
        .map((e) => MoviesResults.fromJson(e))
        .toList();
  }
}