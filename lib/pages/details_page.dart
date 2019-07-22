import 'package:flutter/material.dart';
import 'package:Flutter_Shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  DetailPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Scaffold(
      appBar: AppBar(title: Text("商品详情")),
      body: Container(
        child: Text(goodsId),
      ),
    );
  }

  void _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    print('加载完成');
  }
}
