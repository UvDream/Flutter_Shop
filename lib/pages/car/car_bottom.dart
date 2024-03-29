import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/car.dart';

class CarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.white,
        child: Provide<CarProvide>(builder: (context, child, val) {
          return Row(
            children: <Widget>[
              _selectAllBt(context),
              _allPriceArea(context),
              _goButton(context)
            ],
          );
        }));
  }

  // 全选
  Widget _selectAllBt(context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: Provide.value<CarProvide>(context).isAllCheck,
            activeColor: Colors.pink,
            onChanged: (bool val) {
              Provide.value<CarProvide>(context).changeAllCheckBtnState(val);
            },
          ),
          Text("全选")
        ],
      ),
    );
  }

  // 合计
  Widget _allPriceArea(context) {
    double allPrice = Provide.value<CarProvide>(context).allPrice;
    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  "合计:",
                  style: TextStyle(fontSize: ScreenUtil().setSp(36)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text('¥${allPrice}',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text('满十元免配送费,预购免配送费',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(22), color: Colors.black38)),
          )
        ],
      ),
    );
  }

  // 结算
  Widget _goButton(context) {
    int allGoodsCount = Provide.value<CarProvide>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setSp(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
          child: Text(
            '结算(${allGoodsCount})',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
