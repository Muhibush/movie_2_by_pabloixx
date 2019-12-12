import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_2_by_pabloixx/movie_model.dart';

class DetailPage extends StatelessWidget {
  final MovieModel model;
  final String heroTag;
  DetailPage({Key key, this.model, this.heroTag}) : super(key: key);

  List<String> listImage = [
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
    'assets/movie_poster/A Beautiful Day in the Neighborhood.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    double paddingLeft = ScreenUtil.instance.setWidth(24);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: ScreenUtil.instance.setHeight(340),
            child: Stack(
              children: <Widget>[
                Container(
                  height: ScreenUtil.instance.setHeight(265),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/movie_poster/The Irishman.jpg',
                      ),
                      alignment: Alignment.topLeft,
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2,2),
                          blurRadius: 4
                      )
                    ]
                  ),
                ),
                Container(
                  height: ScreenUtil.instance.setHeight(265),
                  color: Colors.black.withOpacity(0.5),
                ),
                Positioned(
                  left: paddingLeft,
                  bottom: ScreenUtil.instance.setHeight(20),
                  child: Hero(
                    tag: heroTag,
                    child: Container(
                      height: ScreenUtil.instance.setHeight(185),
                      width: ScreenUtil.instance.setWidth(115),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              model.poster,
                            ),
                            alignment: Alignment.topLeft,
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                offset: Offset(4,4),
                                blurRadius: ScreenUtil.instance.setHeight(14)
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: ScreenUtil.instance.setWidth(150),
                  bottom: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: ScreenUtil.instance.setHeight(75),
                        width: ScreenUtil.instance.setWidth(215),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: "titleTag",
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  model.firstTitle,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Tomb Raider',
                                      fontSize: ScreenUtil.instance.setSp(34),
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ),
                            Hero(
                              tag: "ratingTag",
                              child: Material(
                                color: Colors.transparent,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: ScreenUtil.instance.setHeight(13),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: ScreenUtil.instance.setHeight(13),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: ScreenUtil.instance.setHeight(13),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: ScreenUtil.instance.setHeight(13),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.withOpacity(0.5),
                                      size: ScreenUtil.instance.setHeight(13),
                                    ),
                                    Text(
                                      ' 4/5',
                                      style: TextStyle(
                                          fontFamily: 'Tomb Raider',
                                          color: Colors.white,
                                          fontSize: ScreenUtil.instance.setSp(14)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenUtil.instance.setHeight(75),
                        width: ScreenUtil.instance.setWidth(215),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(15),
                            ),
                            Text(
                              'DIRECTOR',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Tomb Raider',
                                  fontSize: ScreenUtil.instance.setSp(14),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Protect our earth together.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(12),
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: paddingLeft,
                    right: paddingLeft,
                    top: ScreenUtil.instance.setHeight(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: ScreenUtil.instance.setHeight(25),
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        size: ScreenUtil.instance.setHeight(35),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: paddingLeft
            ),
            color: Colors.white,
            child: Text(
              'Lara Croft, a courageous and independent young woman, sets out on a dangerous journey to unravel the truth behind her adventurer father`s mysterious disappearance.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(10),
                height: 1.6,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: paddingLeft,
              right: paddingLeft,
              top: ScreenUtil.instance.setHeight(30),
              bottom: ScreenUtil.instance.setHeight(30)
            ),
            height: ScreenUtil.instance.setHeight(185),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/movie_poster/The Irishman.jpg',
                  ),
                  alignment: Alignment.topLeft,
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: Offset(4,4),
                      blurRadius: ScreenUtil.instance.setHeight(20)
                  )
                ]
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            indent: paddingLeft,
            endIndent: paddingLeft,
            color: Colors.grey,
          ),

          Padding(
            padding: EdgeInsets.only(
              left: paddingLeft,
              top: ScreenUtil.instance.setHeight(20)
            ),
            child: Text(
              'DIRECTOR',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Tomb Raider',
                  fontSize: ScreenUtil.instance.setSp(14),
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.instance.setHeight(5)
            ),
//            color: Colors.red,
            height: ScreenUtil.instance.setHeight(55),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listImage.length+1,
              itemBuilder: (context, index){
                return index==0
                    ?SizedBox(
                  width: paddingLeft,
                )
                    :Container(
                  height: ScreenUtil.instance.setHeight(55),
                  width: ScreenUtil.instance.setHeight(55),
                  margin: EdgeInsets.only(
                      right: ScreenUtil.instance.setWidth(15)
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.instance.setWidth(14)
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/movie_poster/The Irishman.jpg',
                      ),
                      alignment: Alignment.topLeft,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
//          Container(
//            height: ScreenUtil.instance.setHeight(200),
//            width: ScreenUtil.instance.setWidth(200),
//            color: Colors.white,
//          ),
        ],
      ),
    );
  }
}
