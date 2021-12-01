import 'package:flutter/material.dart';
import 'package:news_api/helper/blog.dart';
import 'package:news_api/helper/news.dart';
import 'package:news_api/views/homepage.dart';
import 'dart:ui';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist = [];
  bool _loading = true;

  void getCategoryNews() async {
    CategoryNewsclass obj1 = CategoryNewsclass();
    await obj1.getNews(widget.category);
    newslist = obj1.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    //articles = getCategories();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Latest',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body:  _loading
          ? Center(
        child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child:Container(
        child: Container(
              padding: EdgeInsets.only(top: 16),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: newslist.length,
                  itemBuilder: (context, index) {
                    return Blog(
                      imageUrl: newslist[index].urlToImage ??"",
                      title: newslist[index].title ?? "",
                      desc: newslist[index].desc ?? "",
                      url: newslist[index].url ?? "",
                    );
                  }),
            ),
          
        ),
      ),
    
    );
  }
}
