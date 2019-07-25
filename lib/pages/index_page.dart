import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './car_page.dart';
import './category_page.dart';
import './home_page.dart';
import './member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/current_index.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBars = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心'))
  ];
  // 对应页面
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CarPage(),
    MemberPage()
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
            backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                items: bottomBars,
                onTap: ((index) => {
                      Provide.value<CurrentIndexProvide>(context)
                          .changeIndex(index)
                    })),
            body: IndexedStack(
              index: currentIndex,
              children: tabBodies,
            ));
      },
    );
  }
}

// class IndexPage extends StatefulWidget {
//   @override
//   _IndexPageState createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage> {
//   // 底部导航栏
//   final List<BottomNavigationBarItem> bottomBars = [
//     BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
//     BottomNavigationBarItem(
//         icon: Icon(CupertinoIcons.search), title: Text('分类')),
//     BottomNavigationBarItem(
//         icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
//     BottomNavigationBarItem(
//         icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心'))
//   ];
//   // 对应页面
//   final List<Widget> tabBodies = [
//     HomePage(),
//     CategoryPage(),
//     CarPage(),
//     MemberPage()
//   ];
//   int currentIndex = 0;
//   var currentPage;
//   // 初始化
//   @override
//   void initState() {
//     currentPage = tabBodies[currentIndex];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 设置尺寸
//     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
//     return Scaffold(
//         backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
//         bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: currentIndex,
//             items: bottomBars,
//             onTap: ((index) => {
//                   setState(() {
//                     currentIndex = index;
//                     currentPage = tabBodies[index];
//                   })
//                 })),
//         body: IndexedStack(
//           index: currentIndex,
//           children: tabBodies,
//         ));
//   }
// }
