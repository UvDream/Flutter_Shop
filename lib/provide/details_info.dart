import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;
  //从后台获取数据
  getGoodsInfo(String id) {
    var formData = {'goodId': id};
    request('getGoodDetailById', formData: formData).then((val) {
      var res = json.decode(val.toString());
      print('商品详情00000000');
      print(res);
      goodsInfo = DetailsModel.fromJson(res);
      notifyListeners();
    });
  }
}
