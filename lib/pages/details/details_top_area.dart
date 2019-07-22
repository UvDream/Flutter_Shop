import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 顶部
class DetailTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context, child, val) {
        var goodsInfo =
            Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
        if (goodsInfo != null) {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _goodsImage(goodsInfo.image1),
                _goodsName(goodsInfo.goodsName),
                _goodsNum(goodsInfo.goodsSerialNumber),
                _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
              ],
            ),
          );
        } else {
          return Text("正在加载中...");
        }
      },
    );
  }

// 图片
  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(440),
    );
  }

  // 名称
  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(name, style: TextStyle(fontSize: ScreenUtil().setSp(30))),
    );
  }

  // 商品编号
  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text('编号:${num}', style: TextStyle(color: Colors.black26)),
    );
  }

// 商品价格
  Widget _goodsPrice(price, comPic) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      child: Row(
        children: <Widget>[
          Text('¥${price}',
              style: TextStyle(
                  color: Colors.red, fontSize: ScreenUtil().setSp(38))),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text("市场价:"),
          ),
          Text(
            '¥${comPic}',
            style: TextStyle(
                decoration: TextDecoration.lineThrough, color: Colors.black26),
          )
        ],
      ),
    );
  }
}
