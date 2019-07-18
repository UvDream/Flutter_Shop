import 'package:flutter/material.dart';
import '../service/service_method.dart';
import './category/left_nav.dart';
import './category/right_top.dart';
// json
import 'dart:convert';
import '../pages/category/right_content.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCatgegoryNav(),
            Column(
              children: <Widget>[
                  RightCategory(),
                  CategoryGoodsList()
                ],
            )
          ],
        ),
      ),
    );
  }
}

