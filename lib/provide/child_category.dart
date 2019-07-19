import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; //子类索引
  String categoryId = '4'; //大类的id
  String subId = '';
  int page = 1; //列表页码
  String noMoreText = ''; // 下拉无更多数据

  getChildCategory(List<BxMallSubDto> list, String id) {
    page = 1;
    noMoreText = '';
    //子类归0
    childIndex = 0;
    categoryId = id;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId = '00';
    all.comments = 'null';
    all.mallSubName = '全部';
    childCategoryList = [all];
    childCategoryList.addAll(list);

    // childCategoryList=list;
    notifyListeners();
  }

  // 改变子类索引
  changeChildIndex(index, String id) {
    page = 1;
    noMoreText = '';
    subId = id;
    childIndex = index;
    notifyListeners();
  }

  //增加page
  addPage() {
    page++;
  }

  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
