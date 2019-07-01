import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './car_page.dart';
import './category_page.dart';
import './home_page.dart';
import './member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 底部导航栏
  final List<BottomNavigationBarItem> bottomBars=[
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    )
  ];
  // 对应页面
  final List tabBodies=[
    HomePage(),
    CategoryPage(),
    CarPage(),
    MemberPage()
  ];
  int currentIndex=0;
  var currentPage;
  // 初始化
  @override
  void initState() {
    currentPage=tabBodies[currentIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomBars,
        onTap: ((index)=>{
          setState((){
            currentIndex=index;
            currentPage=tabBodies[index];
          })
        })
      ),
      body: currentPage,
    );
  }
}