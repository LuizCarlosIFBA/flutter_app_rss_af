import 'package:flutter/material.dart';
import 'package:flutter_app_rss_af/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsPage extends StatefulWidget {
  NewsDetailsPage({Key key, this.model}) : super(key: key);
  final NewsModelItem model;

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  NewsModelItem get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),

      body: Center(
        child: WebView(
          initialUrl: model.link,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),

    );
  }
}
