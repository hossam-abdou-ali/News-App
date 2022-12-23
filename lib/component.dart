import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BottomItems(articleModel, index, context) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: articleModel!.articles![index].urlToImage != null ? DecorationImage(
                image: NetworkImage(articleModel!.articles![index].urlToImage.toString()),
                fit: BoxFit.cover) : const DecorationImage(
                image: AssetImage("assets/images/simpson.png"), fit: BoxFit.cover),
          )
      ),
      SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                articleModel!.articles![index].title.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15.0),
              )),
              Text(
                articleModel!.articles![index].publishedAt.toString(),
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

void Navigateto(context, Widget) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => Widget),);
