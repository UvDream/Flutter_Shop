import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/car_info.dart';

class CarProvide with ChangeNotifier {
  String carString = "[]";

  List<CarInfoModel> carList = [];
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
        'images': images
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
      tempList.forEach((item) {
        carList.add(CarInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }
}
