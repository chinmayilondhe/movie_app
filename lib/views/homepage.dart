import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_api/data.dart';
import 'package:news_api/helper/blog.dart';
import 'package:news_api/helper/news.dart';
import 'package:news_api/models/article_model.dart';
import 'package:news_api/models/category_model.dart';
import 'package:news_api/views/article_view.dart';
import 'package:news_api/views/category_view.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading=true;

 void getNews() async {
    News obj = News();
    await obj.getNews();
    articles = obj.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {

    super.initState();
    categories = getCategories();
    getNews();
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
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                                      
                   
                    //categories
                    Container(
                      
                      height: 90,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Card1(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName);
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                     Text('Top Headlines in India',
                     style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black87 ),),
                    //blogs
                    Container(

                      padding:EdgeInsets.only(top:16),
                      child:Card(
                        elevation: 3,
                        margin:EdgeInsets.all(3),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return Blog(
                              imageUrl: articles[index].urlToImage?? "",
                              title:articles[index].title?? "",
                              desc: articles[index].desc?? "",
                              url:articles[index].url??"",
          
                            );
                          }),)
                    ),
                  ],
                ),
              ),
          ),
    );
  }
}

class Card1 extends StatelessWidget {
  final imageUrl, categoryName;
  Card1({required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)=>CategoryNews(
           category: categoryName.toLowerCase(),
          )));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:CachedNetworkImage(
              imageUrl:imageUrl,
              width: 170,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
            width: 170,
            height: 120,
            alignment: Alignment.center,
            child: Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              //textAlign:TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}

