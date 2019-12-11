class MovieModel {
  String title;
  double rating;
  String genres;
  String actors;
  String plot;
  String poster;

  String get firstTitle {
    return title.split(" ")[0];
  }

  String get lastTitle {
    return title.replaceFirst(firstTitle, "").trim();
  }

  MovieModel(
      {
        this.title,
        this.rating,
        this.genres,
        this.actors,
        this.plot,
        this.poster});

  MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rating = json['year'];
    genres = json['runtime'];
    actors = json['actors'];
    plot = json['plot'];
    poster = json['posterUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['year'] = this.rating;
    data['genres'] = this.genres;
    data['actors'] = this.actors;
    data['plot'] = this.plot;
    data['posterUrl'] = this.poster;
    return data;
  }
}