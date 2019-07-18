
import 'package:flutter/material.dart';
import 'dart:convert';
import '../../service/service_method.dart';

// 商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  @override
  void initState() {
    super.initState();
    _getGoodsLIst();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("xxx"),
    );
  }
  void _getGoodsLIst() async{
    var data={
      'categoryId':'4',
      'categorySubId':'',
      'page':1
    };
    await request('getMallGoods',formData: data).then((val){
      var data=json.decode(val.toString());
      print("商品列表-----------${data}");
    });
  }


}
