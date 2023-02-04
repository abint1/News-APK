import 'package:flutter/material.dart';
import 'package:loginfirebase/src/models/news_model.dart';

class NewContent extends StatelessWidget {
  final Articles data;
  const NewContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.author.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data.urlToImage.toString()),
                        fit: BoxFit.fill)),
              ),
            ),

            // Text(data.title.toString()),
            //SizedBox(height: 30,),
            Flexible(
                child: Text(
              data.content.toString(),
            )),
            //  SizedBox(height: 30,),
            // Text(data.source.toString(),),
            // SizedBox(height: 30,),
            // Text(data.publishedAt.toString()),
          ]),
        ),
      ),
    );
  }
}
