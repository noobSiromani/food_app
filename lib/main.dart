import 'package:flutter/material.dart';
import './colors.dart';
import './pages/launch_page.dart';
import './pages/item_detail_page.dart';



main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "", 
      home: ItemDetailViewer(1),
      theme: ThemeData(
        primaryColor: primaryOne,
        accentColor: primaryTwo
      ),
      )
    );
}

