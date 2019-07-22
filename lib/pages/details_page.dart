import 'package:flutter/material.dart';
import 'package:Flutter_Shop/provide/details_info.dart';
import 'package:provide/provide.dart';
import './details/details_top_area.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  DetailPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text("商品详情")),
        body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  children: <Widget>[DetailTopArea()],
                ),
              );
            } else {
              return Text("加载中");
            }
          },
        ));
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}
