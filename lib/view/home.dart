import 'package:flutter/material.dart';
import 'package:news_app/controller/fetchNews.dart';
import 'package:news_app/model/newsArt.dart';
import 'package:news_app/view/widgets/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArt newsArt;

  GetNews() async{
    newsArt = await FetchNews.fetchNews();
    setState(() {});
  }

  @override
  void initState() {
    FetchNews.fetchNews();
    GetNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,

          onPageChanged: (value){
            GetNews();
          },

          itemBuilder:(context, index){
            return NewsContainer(
              imgUrl:newsArt.imgUrl,
              newsCnt:newsArt.newsCnt,
              newsHead: newsArt.newsHead,
              newsDes: newsArt.newsDes,
              newsUrl: newsArt.newsUrl,
            );
      }),
    );
  }
}
