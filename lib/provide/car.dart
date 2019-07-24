import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/car_info.dart';

class CarProvide with ChangeNotifier {
  String carString = "[]";

  List<CarInfoModel> carList = [];

  double allPrice = 0; //总价格
  int allGoodsCount = 0; //商品总数量
// 保存
  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    carString = prefs.getString('carInfo');
    var temp = carString == null ? [] : json.decode(carString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int ival = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[ival]['count'] = item['count'] + 1;
        carList[ival].count++;
        isHave = true;
      }
      ival++;
    });
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': true
      };
      tempList.add(newGoods);
      carList.add(CarInfoModel.fromJson(newGoods));
    }

    carString = json.encode(tempList).toString();
    print('字符串' + carString);
    print('数据模型${carList}');
    prefs.setString('carInfo', carString);
    notifyListeners();
  }

// 删除
  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 清空数据模型
    carList = [];
    prefs.remove('carInfo');
    print('清空完成---');
    notifyListeners();
  }

  // 获取
  getCarInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    carString = prefs.getString('carInfo');
    carList = [];
    if (carString == null) {
      carList = [];
    } else {
      List<Map> tempList = (json.decode(carString.toString()) as List).cast();
      allPrice = 0;
      allGoodsCount = 0;
      tempList.forEach((item) {
        if (item['isCheck']) {
          allPrice += item['count'] * item['price'];
          allGoodsCount += item['count'];
        }
        carList.add(CarInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

//  删除单个购物车商品
  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    carString = prefs.getString('carInfo');
    List<Map> tempList = (json.decode(carString.toString()) as List).cast();
    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    carString = json.encode(tempList);
    prefs.setString('carInfo', carString);
    await getCarInfo();
  }

// 改变
  changeCheckState(CarInfoModel carItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    carString = prefs.getString('carInfo');
    List<Map> tempList = (json.decode(carString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item["goodsId"] == carItem.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = carItem.toJson();
    carString = json.encode(tempList).toString();
    prefs.setString('carInfo', carString);
    await getCarInfo();
  }
}
