import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import '../../service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/categoryGoodsList.dart';

// 商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List list = [];

  @override
  void initState() {
    super.initState();
    _getGoodsLIst();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(985),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listWidget(index);
        },
      ),
    );
  }

  void _getGoodsLIst() async {
    var data = {'categoryId': '4', 'categorySubId': '', 'page': 1};
    await request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      // print('++++++++++商品内容+++++++++');
      // print(goodsList);
      setState(() {
        list = goodsList.data;
      });
    });
  }

  // 商品图片
  Widget _goodsImage(index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  // 商品名
  Widget _goodsName(index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(index) {
    return Container(
      width: ScreenUtil().setWidth(370),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
            '价格:¥${list[index].presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '${list[index].oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  // 组合
  Widget _listWidget(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            _goodsImage(index),
            Column(
              children: <Widget>[_goodsName(index), _goodsPrice(index)],
            )
          ],
        ),
      ),
    );
  }
}
