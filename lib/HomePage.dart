import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_2_by_pabloixx/DetailPage.dart';
import 'package:movie_2_by_pabloixx/FadeAnimation.dart';
import 'package:movie_2_by_pabloixx/movie_model.dart';
import 'package:simple_animations/simple_animations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeClassIndex;
  Playback playback;
  FadeDirection fadeDirection;
  List<String> listCategory = [
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary"
  ];
  MovieModel activeModel = new MovieModel();
  List<MovieModel> movies =[
    MovieModel(
        title: "A Beautiful Day in the Neighborhood",
        rating: 3.95,
        genres: "Biography, Drama",
        plot: "Based on the true story of a real-life friendship between Fred Rogers and journalist Tom Junod.",
        actors: "Tom Hanks, Matthew Rhys, Chris Cooper",
        poster: "assets/movie_poster/A Beautiful Day in the Neighborhood.jpg"
    ),
    MovieModel(
        title: "Dark Waters",
        rating: 3.75,
        genres: "Biography, Drama, History",
        plot: "A corporate defense attorney takes on an environmental lawsuit against a chemical company that exposes a lengthy history of pollution.",
        actors: "Anne Hathaway, Mark Ruffalo, William Jackson Harper",
        poster: "assets/movie_poster/Dark Waters.jpg"
    ),
    MovieModel(
        title: "The Irishman",
        rating: 4.15,
        genres: "Biography, Crime, Drama",
        plot: "A mob hitman recalls his possible involvement with the slaying of Jimmy Hoffa.",
        actors: "Robert De Niro, Al Pacino, Joe Pesci",
        poster: "assets/movie_poster/The Irishman.jpg"
    ),
    MovieModel(
        title: "Knives Out",
        rating: 4.1,
        genres: "Comedy, Crime, Drama",
        plot: "A detective investigates the death of a patriarch of an eccentric, combative family.",
        actors: "Daniel Craig, Chris Evans, Ana de Armas",
        poster: "assets/movie_poster/Knives Out.jpg"
    ),
    MovieModel(
        title: "It Chapter Two",
        rating: 3.35,
        genres: "Drama, Fantasy, Horror",
        plot: "Twenty-seven years after their first encounter with the terrifying Pennywise, the Losers Club have grown up and moved away, until a devastating phone call brings them back.",
        actors: "Jessica Chastain, James McAvoy, Bill Hader",
        poster: "assets/movie_poster/It Chapter Two.jpg"
    ),
    MovieModel(
        title: "Angel Has Fallen",
        rating: 3.2,
        genres: "Action, Thriller",
        plot: "Mike Banning is framed for the attempted assassination of the President and must evade his own agency and the FBI as he tries to uncover the real threat.",
        actors: "Gerard Butler, Frederick Schmidt, Danny Huston",
        poster: "assets/movie_poster/Angel Has Fallen.jpg"
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeClassIndex = 0;
    activeModel = movies[0];
    playback = Playback.PLAY_FORWARD;
    fadeDirection = FadeDirection.left;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    double paddingLeft = ScreenUtil.instance.setWidth(24);

    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/movie_poster/The Irishman.jpg',
                ),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/movie_poster/The Irishman.jpg',
                ),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                )
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: paddingLeft,
                    right: paddingLeft,
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
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: paddingLeft*2,
                    top: ScreenUtil.instance.setHeight(10)
                  ),
                  child: Text(
                    'Discover',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(33),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  height: ScreenUtil.instance.setHeight(35),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listCategory.length,
                    itemBuilder: (context, index){
                      return Center(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              activeClassIndex=index;
                              playback=Playback.START_OVER_FORWARD;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: index==0?paddingLeft*2:0
                            ),
                            height: ScreenUtil.instance.setHeight(31),
                            padding: EdgeInsets.only(
                                right: ScreenUtil.instance.setWidth(40)
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              listCategory[index],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(16),
                                fontWeight: activeClassIndex==index
                                    ?FontWeight.bold
                                    :FontWeight.normal,
                                color: activeClassIndex==index
                                    ?Colors.white
                                    :Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setHeight(20)
                  ),
                  height: ScreenUtil.instance.setHeight(430),
                  width: ScreenUtil.instance.setWidth(375),
                  child: Swiper(
                    itemCount: movies.length,
                    viewportFraction: 0.7,
                    onIndexChanged: (index){
                      setState(() {
                        activeModel = movies[index];
                      });
                    },
                    scale: 0.8,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => DetailPage()),
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    movies[index].poster,
                                  ),
                                  alignment: Alignment.bottomCenter,
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(2,2),
                                      blurRadius: 4
                                  )
                                ]
                            )
                        ),
                      );
                    },
                  ),
                ),
                FadeAnimation(
                  delay: 1.2,
                  fadeDirection: FadeDirection.left,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddingLeft*2,
                        top: ScreenUtil.instance.setHeight(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          activeModel.firstTitle,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Tomb Raider',
                              fontSize: ScreenUtil.instance.setSp(34),
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        Text(
                          activeModel.lastTitle,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(12),
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.instance.setHeight(8),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: ScreenUtil.instance.setHeight(15),
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  return Icon(
                                    Icons.star,
                                    color: activeModel.rating-1<index
                                        ?Colors.yellow.withOpacity(0.5)
                                        :Colors.yellow,
                                    size: ScreenUtil.instance.setHeight(13),
                                  );
                                }
                              ),
                            ),
                            Text(
                              " ${activeModel.rating}/5",
                              style: TextStyle(
                                fontFamily: 'Tomb Raider',
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(14)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(20)
                  ),
                  height: ScreenUtil.instance.setHeight(25),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listCategory.length,
                    itemBuilder: (context, index){
                      return Center(
                        child: Container(
                          height: ScreenUtil.instance.setHeight(25),
                          margin: EdgeInsets.only(
                              left: index==0?paddingLeft*2:0,
                              right: ScreenUtil.instance.setWidth(15)
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil.instance.setWidth(14)
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 0.6
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
