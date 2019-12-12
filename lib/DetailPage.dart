import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_2_by_pabloixx/movie_model.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatefulWidget {
  final MovieModel model;
  final String heroTag;
  DetailPage({Key key, this.model, this.heroTag}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  List<String> listImage = [
    "assets/cast_image/cast1.jpg",
    "assets/cast_image/cast2.jpeg",
    "assets/cast_image/cast3.jpg",
    "assets/cast_image/cast4.jpeg",
    "assets/cast_image/cast5.jpg",
    "assets/cast_image/cast6.webp",
    "assets/cast_image/cast7.jpg",
    "assets/cast_image/cast8.jpeg",
    "assets/cast_image/cast9.jpg",
    "assets/cast_image/cast1.jpg",
    "assets/cast_image/cast2.jpeg",
    "assets/cast_image/cast3.jpg",
    "assets/cast_image/cast4.jpeg",
    "assets/cast_image/cast5.jpg",
    "assets/cast_image/cast6.webp",
    "assets/cast_image/cast7.jpg",
    "assets/cast_image/cast8.jpeg",
    "assets/cast_image/cast9.jpg",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        'assets/movie_trailer_video/Exclusive.mp4');

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: ScreenUtil.instance.setWidth(327) / ScreenUtil.instance.setHeight(185),
        autoPlay: true,
        looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

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
                    tag: widget.heroTag,
                    child: Container(
                      height: ScreenUtil.instance.setHeight(185),
                      width: ScreenUtil.instance.setWidth(115),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              widget.model.poster,
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
                        width: ScreenUtil.instance.setWidth(215),
                        margin: EdgeInsets.only(
                          bottom: ScreenUtil.instance.setHeight(5)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: "titleTag",
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  widget.model.title,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Tomb Raider',
                                      height: 0.9,
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
                                    Container(
                                      height: ScreenUtil.instance.setHeight(15),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index){
                                            return Icon(
                                              Icons.star,
                                              color: widget.model.rating-1<index
                                                  ?Colors.yellow.withOpacity(0.5)
                                                  :Colors.yellow,
                                              size: ScreenUtil.instance.setHeight(13),
                                            );
                                          }
                                      ),
                                    ),
                                    Text(
                                      " ${widget.model.rating}/5",
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
                              widget.model.director,
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
              widget.model.plot,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(10),
                height: 1.6,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.8),
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
            child: Chewie(
              controller: _chewieController,
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
              'CAST',
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
                top: ScreenUtil.instance.setHeight(10)
            ),
            height: ScreenUtil.instance.setHeight(55),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listImage.length,
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
                        listImage[index],
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
