import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import './home/swiper.dart';
import './home/top_navigator.dart';
import './home/advertise.dart';
import './home/leader.dart';
import './home/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // 保持状态
  @override
  bool get wantKeepAlive => true;

  String homePageContent = "正在获取数据";

  @override
  void initState() {
    getHomePageContent().then((val) {
      setState(() {
        homePageContent = val.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("百姓生活+")),
          body: FutureBuilder(
            future: getHomePageContent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                // 轮播图
                List<Map> swiper = (data['data']['slides'] as List).cast();
                // 栅格
                List<Map> navgatorList =
                    (data['data']['category'] as List).cast();
                // 广告
                String adPicture =
                    data['data']['advertesPicture']['PICTURE_ADDRESS'];
                //店长图片
                String leaderImage = data['data']['shopInfo']['leaderImage'];
                //店长电话
                String leaderPhone = data['data']['shopInfo']['leaderPhone'];
                // 商品推荐
                List<Map> recommendList =
                    (data['data']['recommend'] as List).cast();
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SwiperDiy(swiperDateList: swiper),
                      TopNavigator(navgatorList: navgatorList),
                      AdBanner(adPicture: adPicture),
                      LeaderPhone(
                          leaderImage: leaderImage,
                          leaderPhone: leaderPhone), //广告组件
                      Recommend(recommendList: recommendList),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("加载中"),
                );
              }
            },
          )),
    );
  }
}
