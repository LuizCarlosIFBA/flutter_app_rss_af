import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main(){
  runApp(MaterialApp(
     
    home: MyApp(),
    ));
}  

 class  MyApp extends StatefulWidget {
   @override
   GetRss createState() => GetRss();
 }
 
 class GetRss extends State<MyApp> {
      List datas;
   Future getreflexion() async{
     var url="https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fportal.uneb.br%2Fnoticias%2Ffeed%2F";      
  final response=await http.get(url);
  setState(() {
  if (response.statusCode == 200) {     
    datas=jsonDecode(response.body)['items'];
  print('${datas[0]['title']}');        
     
      }
  });

    return null;
   }

void initState(){
     super.initState();  
     this.getreflexion();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('portal.uneb.br'),

       ),
      body: Container(
        child: ListView.builder(
          itemCount: datas==null? 0:datas.length,
          itemBuilder: (context,index){
            return Container(
                child: Card(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${datas[index]['title']}',style: TextStyle(fontWeight: FontWeight.bold),),
                   
                     Text('${datas[index]['link']}'),
                     Text('${datas[index]['guid']}'),
                      Text('${datas[index]['author']}'),
                       Text('${datas[index]['pubDate']}'),
                  ],
                ),
                )
            );
          },
        ),
      ),
       
     );
   }
 }