import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

Handler detailhandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsId = params['id'].first;
  print('路由参数${goodsId}');
  return DetailPage(goodsId);
});
