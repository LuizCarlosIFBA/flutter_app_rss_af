import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class GetRss {

  static Future<List<Noticia>> getRss() async {
    var data = await http.get(
        "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fportal.uneb.br%2Fnoticias%2Ffeed%2F",
        headers: {
          "Content-Type": "application/json"
        });

    var rssFeed = new RssFeed.parse(data.body.toString());
    List<Noticia> noticias = new List(); //listado de noticias que se devuelven a la interfaz

    for (int i = 0; i < rssFeed.items.length; i++) {
      print('prueba: $rssFeed');   

      print("Título: " + rssFeed.items[i].title);
      print("Descrição: " + rssFeed.items[i].description);//fuck
      print("Data: " + rssFeed.items[i].pubDate);
      print("Link: " + rssFeed.items[i].link);
      print("\n");

      noticias.add(new Noticia(rssFeed.items[i].title, rssFeed.items[i].description, rssFeed.items[i].pubDate,
          rssFeed.items[i].link));
    }

    return noticias;
  }

}

class Noticia {

  String _titulo, _descripcion, _fecha, _urlNoticia;

  Noticia(this._titulo, this._descripcion, this._fecha,this._urlNoticia);

  get urlNoticia => _urlNoticia;

  set urlNoticia(value) {
    _urlNoticia = value;
  }

  get fecha => _fecha;

  set fecha(value) {
    _fecha = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }


}