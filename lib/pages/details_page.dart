import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  DetailPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品详情")),
      body: Container(
        child: Text(goodsId),
      ),
    );
  }
}
