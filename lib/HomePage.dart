import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_2_by_pabloixx/DetailPage.dart';
import 'package:movie_2_by_pabloixx/FadeAnimation.dart';
import 'package:movie_2_by_pabloixx/movie_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0, viewportFraction: 0.7);
  List<String> listCategory = [
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary"
  ];
  List<MovieModel> movies = [
    MovieModel(
        title: "Dark Waters",
        director: "Todd Haynes",
        rating: 3.75,
        genres: "Biography, Drama, History",
        plot: "A corporate defense attorney takes on an environmental lawsuit against a chemical company that exposes a lengthy history of pollution.",
        actors: "Anne Hathaway, Mark Ruffalo, William Jackson Harper",
        poster: "assets/movie_poster/Dark_Waters.jpg"),
    MovieModel(
        title: "A Beautiful Day in the Neighborhood",
        director: "Marielle Heller",
        rating: 3.95,
        genres: "Biography, Drama",
        plot: "Based on the true story of a real-life friendship between Fred Rogers and journalist Tom Junod.",
        actors: "Tom Hanks, Matthew Rhys, Chris Cooper",
        poster: "assets/movie_poster/A_Beautiful.jpg"),
    MovieModel(
        title: "Angel Has Fallen",
        director: "Ric Roman Waugh",
        rating: 3.2,
        genres: "Action, Thriller",
        plot: "Mike Banning is framed for the attempted assassination of the President and must evade his own agency and the FBI as he tries to uncover the real threat.",
        actors: "Gerard Butler, Frederick Schmidt, Danny Huston",
        poster: "assets/movie_poster/Angel_Has.jpg"),
    MovieModel(
        title: "It Chapter Two",
        director: "Andy Muschietti",
        rating: 3.35,
        genres: "Drama, Fantasy, Horror",
        plot: "Twenty-seven years after their first encounter with the terrifying Pennywise, the Losers Club have grown up and moved away, until a devastating phone call brings them back.",
        actors: "Jessica Chastain, James McAvoy, Bill Hader",
        poster: "assets/movie_poster/It_Chapter.jpg"),
    MovieModel(
        title: "Knives Out",
        director: "Rian Johnson",
        rating: 4.1,
        genres: "Comedy, Crime, Drama",
        plot: "A detective investigates the death of a patriarch of an eccentric, combative family.",
        actors: "Daniel Craig, Chris Evans, Ana de Armas",
        poster: "assets/movie_poster/Knives_Out.jpg"),
    MovieModel(
        title: "The Irishman",
        director: "Martin Scorsese",
        rating: 4.15,
        genres: "Biography, Crime, Drama",
        plot: "A mob hitman recalls his possible involvement with the slaying of Jimmy Hoffa.",
        actors: "Robert De Niro, Al Pacino, Joe Pesci",
        poster: "assets/movie_poster/The_Irishman.jpg"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return Material(
      child: ChangeNotifierProvider(
        create: (_) => PageOffsetNotifier(pageController, movies.length),
        lazy: false,
        child: Stack(
          children: <Widget>[
            Background(
              movies: movies,
            ),
            Cover(
              movies: movies,
            ),
            BlurEffect(),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyAppBar(),
                  PageTitle(),
                  TopGenre(
                    listCategory: listCategory,
                  ),
                  ListItem(
                    movies: movies,
                    pageController: pageController,
                  ),
                  InfoMovie(
                    movies: movies,
                  ),
                  BottomGenre(
                    listCategory: listCategory,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;
  int _moviesLength = 0;

  PageOffsetNotifier(PageController pageController, int moviesLength) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = min(pageController.page, moviesLength - 1.toDouble());
      _moviesLength = moviesLength;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;

  bool get isLast => _page >= _moviesLength - 1;
}

class Background extends StatelessWidget {
  final List<MovieModel> movies;
  const Background({Key key, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, offsetNotifier, _) {
        return offsetNotifier.isLast
            ? Container()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      movies[offsetNotifier.page.toInt() + 1].poster,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
      },
    );
  }
}

class Cover extends StatelessWidget {
  final List<MovieModel> movies;

  const Cover({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, offsetNotifier, _) {
        return ClipPath(
          clipper: CoverClipper(offsetNotifier.page),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  movies[offsetNotifier.page.toInt()].poster,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class BlurEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.6)),
        ));
  }
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil.instance.setWidth(24),
        right: ScreenUtil.instance.setWidth(24),
        top: ScreenUtil.instance.setHeight(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.subject,
            size: ScreenUtil.instance.setHeight(35),
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: ScreenUtil.instance.setHeight(35),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      fadeDirection: FadeDirection.left,
      delay: 1.5,
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(48),
            top: ScreenUtil.instance.setHeight(10)),
        child: Text(
          'Discover',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.instance.setSp(33),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TopGenre extends StatefulWidget {
  final List<String> listCategory;

  const TopGenre({Key key, this.listCategory}) : super(key: key);
  @override
  _TopGenreState createState() => _TopGenreState();
}

class _TopGenreState extends State<TopGenre> {
  int activeClassIndex;

  @override
  void initState() {
    super.initState();
    activeClassIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      fadeDirection: FadeDirection.left,
      delay: 2,
      child: Container(
        height: ScreenUtil.instance.setHeight(35),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listCategory.length,
          itemBuilder: (context, index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeClassIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? ScreenUtil.instance.setWidth(48) : 0),
                  height: ScreenUtil.instance.setHeight(31),
                  padding:
                      EdgeInsets.only(right: ScreenUtil.instance.setWidth(40)),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    widget.listCategory[index],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(16),
                      fontWeight: activeClassIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: activeClassIndex == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final List<MovieModel> movies;
  final PageController pageController;

  ListItem({Key key, this.movies, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        fadeDirection: FadeDirection.left,
        delay: 2.5,
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(20)),
        height: ScreenUtil.instance.setHeight(430),
        width: ScreenUtil.instance.setWidth(375),
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: movies.length,
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            String heroTagPoster = index.toString();
            return MovieCard(
              movieModel: movies[index],
              heroTagPoster: heroTagPoster,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class InfoMovie extends StatelessWidget {
  final List<MovieModel> movies;

  const InfoMovie({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      fadeDirection: FadeDirection.left,
      delay: 3,
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(48),
            top: ScreenUtil.instance.setHeight(20)),
        child:
            Consumer<PageOffsetNotifier>(builder: (context, offsetNotifier, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: "titleTag",
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    movies[offsetNotifier.page.round()].firstTitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tomb Raider',
                        fontSize: ScreenUtil.instance.setSp(34),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Text(
                movies[offsetNotifier.page.round()].lastTitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(12),
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenUtil.instance.setHeight(8),
              ),
              Hero(
                tag: "ratingTag",
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: ScreenUtil.instance.setHeight(15),
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Icon(
                                Icons.star,
                                color:
                                    movies[offsetNotifier.page.round()].rating -
                                                1 <
                                            index
                                        ? Colors.yellow.withOpacity(0.5)
                                        : Colors.yellow,
                                size: ScreenUtil.instance.setHeight(13),
                              );
                            }),
                      ),
                      Text(
                        " ${movies[offsetNotifier.page.round()].rating}/5",
                        style: TextStyle(
                            fontFamily: 'Tomb Raider',
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(14)),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class BottomGenre extends StatelessWidget {
  final List<String> listCategory;

  const BottomGenre({Key key, this.listCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      fadeDirection: FadeDirection.left,
      delay: 3.5,
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(20)),
        height: ScreenUtil.instance.setHeight(25),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCategory.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                height: ScreenUtil.instance.setHeight(25),
                margin: EdgeInsets.only(
                    left: index == 0 ? ScreenUtil.instance.setWidth(48) : 0,
                    right: ScreenUtil.instance.setWidth(15)),
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.instance.setWidth(14)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white.withOpacity(0.6), width: 0.6),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Text(
                  listCategory[index],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(12),
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  final int index;
  final String heroTagPoster;

  const MovieCard({Key key, this.movieModel, this.index, this.heroTagPoster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, offsetNotifier, _) {
        double marginTopAndBottom = (offsetNotifier.page - index).abs() *
            ScreenUtil.instance.setHeight(20);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailPage(
                        model: movieModel,
                        heroTag: heroTagPoster,
                      )),
            );
          },
          child: Hero(
            tag: heroTagPoster,
            child: Container(
                margin: EdgeInsets.only(
                  right: ScreenUtil.instance.setWidth(20),
                  bottom: marginTopAndBottom,
                  top: marginTopAndBottom,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage(
                        movieModel.poster,
                      ),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2, 2),
                          blurRadius: 4)
                    ])),
          ),
        );
      },
    );
  }
}

class CoverClipper extends CustomClipper<Path> {
  double page;

  CoverClipper(this.page);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * (page - page.floor()), size.height);
    path.lineTo(size.width * (page - page.floor()), 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CoverClipper oldClipper) => page != oldClipper.page;
}
