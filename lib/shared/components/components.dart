import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget myDivider() {
  return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        height: 1.0,
        color: Colors.deepOrange,
      ));
}

Widget articleBuilder(article, context) {
  return InkWell(
    onTap: (){
      launchURL(article['url']);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${article['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


void launchURL(url) async =>
    await canLaunch(url) ? await launch(url, enableJavaScript: true, forceWebView: true,) : throw 'Could not launch $url';