class MovieModel {
  String title;
  String director;
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
        this.director,
        this.rating,
        this.genres,
        this.actors,
        this.plot,
        this.poster});
}