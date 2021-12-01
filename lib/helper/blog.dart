import 'package:flutter/material.dart';
import 'package:news_api/views/article_view.dart';
class Blog extends StatelessWidget {
  final String imageUrl, title, desc,url;
  Blog({required this.desc, required this.imageUrl, required this.title,required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)=>ArticleView(
            blogUrl: url,
          )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [Image.network(imageUrl),
            SizedBox(height: 6,),
             Text(title,style: TextStyle(fontSize: 19),textAlign: TextAlign.left,),
              SizedBox(height: 4,),
              Text(desc,style: TextStyle(fontSize: 15,color: Colors.black54),)],
          ),
        ),
      ),
    );
  }
}