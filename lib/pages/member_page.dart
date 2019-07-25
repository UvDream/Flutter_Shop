import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('个人中心'),
        ),
        body: ListView(
          children: <Widget>[
            _topHeader(),
            _orderTitle(),
            _orderType(),
            _actionList()
          ],
        ));
  }

  Widget _topHeader() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(200),
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network(
                  'https://avatars0.githubusercontent.com/u/33121872?s=460&v=4'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('UvDream',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(36), color: Colors.black54)),
          )
        ],
      ),
    );
  }

  // 订单栏
  Widget _orderTitle() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        child: ListTile(
          leading: Icon(Icons.list),
          title: Text('我的订单'),
          trailing: Icon(Icons.arrow_right),
        ));
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setHeight(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.query_builder,
                  size: 30,
                ),
                Text('待付款')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.monochrome_photos,
                  size: 30,
                ),
                Text('待发货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.money_off,
                  size: 30,
                ),
                Text('待收货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.mood,
                  size: 30,
                ),
                Text('待评价')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myListTile(title) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
    );
  }

  Widget _actionList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('关于我们')
        ],
      ),
    );
  }
}
