import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsContainer({super.key,
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imgUrl,
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsHead.length>70 ?
                    "${newsHead.substring(0, 70)}..." : newsHead,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 10,),
                  Text(newsDes, style: TextStyle(fontSize: 12, color: Colors.black38),),
                  SizedBox(height: 10,),
                  Text(
                      newsCnt.length > 250 ?
                      "${newsCnt.toString().substring(0,250)}...":"${newsCnt.toString().substring(0,newsCnt.length-15)}...",
                    style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Pressed");
                        },
                        child: Text("Read More")),
                ),
              ],
            ),
            SizedBox(height: 20,),
        ],
        )
    );
  }
}
