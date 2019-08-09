import 'package:flutter/material.dart';
import 'package:flutter_app_rss_af/views/home_page.dart';

main() {
  runApp(
    MaterialApp(
      title: 'UNEB',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    ),
  );
}
