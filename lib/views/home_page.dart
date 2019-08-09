import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_rss_af/model/news_model.dart';
import 'package:flutter_app_rss_af/views/news_details_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: FutureBuilder(
        future: getNews(),
        builder: (BuildContext context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.data != null) {
            return buildNewsList(snapshot.data);
          } else {
            return buildPreloader();
          }
        },
      ),
    );
  }

  // traer los datos del RSS
  Future<NewsModel> getNews() async {
    final response = await http.get("https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fportal.uneb.br%2Fnoticias%2Ffeed%2F");
//    await Future.delayed(Duration(seconds: 2));
    return NewsModel.fromMap(jsonDecode(response.body));
  }

  Widget buildNewsList(NewsModel news) {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return buildNewsListItem(context, news.items[index]);
          },
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemCount: news.items.length),
    );
  }

  Widget buildPreloader() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.cloud_download),
          SizedBox(height: 10),
          Text("Carregando Informações..."),
        ],
      ),
    );
  }

  Widget buildNewsListItem(context, NewsModelItem model) {
    // llama al metodo toString() del NewsItem.
//    print(item);
    return ListTile(
      
      title: Text(
        model.title,
        style: TextStyle(fontSize: 15, color: Colors.black54),
      ),
      subtitle: Text(
        model.pubDate.toString(),
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsPage(
              model: model,
              key: null,
            ),
          ),
        );
      },
    );
  }
}
