import 'package:flutter/material.dart';
import 'package:flutter_app_rss_af/NewsDetails.dart';

import 'GetRss.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNEB',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Notícias UNEB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    GetRss get = new GetRss();
    setState(() {
     get.getreflexion();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: FutureBuilder(
            future:get.getreflexion(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                // TODO: Handle this case.
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.cloud_download),
                        Text("Carregando Informações...")
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                // TODO: Handle this case.
                  break;
                case ConnectionState.done:
                  return Container(
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          String url;
                          if (snapshot.data[index].urlImagen != "") {
                            url = snapshot.data[index].urlImagen;
                          } else {
                            url = "https://dx-world.net/wp-content/uploads/2017/10/no-news-good-news.png";
                          }
                          return ListTile(
                            leading: Image.network(url),
                            title: Text(snapshot.data[index].titulo,
                              style: TextStyle(fontSize: 15, color: Colors.black54),),
                            subtitle: Text(snapshot.data[index].fecha,
                              style: TextStyle(fontSize: 15, color: Colors.black),),
                            onTap: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    NewsDetails(
                                      title: "UNEB",
                                      url: snapshot.data[index].urlNoticia,
                                      key: null,
                                    ),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Divider(
                              color: Colors.grey,
                            ),
                        itemCount: snapshot.data.length
                    ),
                  );
                  break;
              }
            }),
      ),

     
    );
  }
}
