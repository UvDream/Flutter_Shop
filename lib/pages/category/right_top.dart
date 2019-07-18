import 'package:flutter/material.dart';
// 屏幕适配方案
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Model 后台请求的数据
import '../../model/category.dart';
// 状态管理
import 'package:provide/provide.dart';
import '../../provide/child_category.dart';

// 右侧
class RightCategory extends StatefulWidget {
  @override
  _RightCategoryState createState() => _RightCategoryState();
}

class _RightCategoryState extends State<RightCategory> {
  // List list=['名酒','宝丰','北京二锅头','茅台','五粮液','江小白'];
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkwell(childCategory.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }

  Widget _rightInkwell(BxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}