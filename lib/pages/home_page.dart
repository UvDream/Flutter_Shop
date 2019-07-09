import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                //楼层商品
                String floor1Title =
                    data['data']['floor1Pic']['PICTURE_ADDRESS'];
                List<Map> floor1 = (data['data']['floor1'] as List).cast();
                String floor2Title =
                    data['data']['floor2Pic']['PICTURE_ADDRESS'];
                List<Map> floor2 = (data['data']['floor2'] as List).cast();
                String floor3Title =
                    data['data']['floor3Pic']['PICTURE_ADDRESS'];
                List<Map> floor3 = (data['data']['floor3'] as List).cast();
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
                      // 楼层标题
                      FloorTitle(picture_address: floor1Title),
                      FloorContent(floorGoodsList: floor1),
                      FloorTitle(picture_address: floor2Title),
                      FloorContent(floorGoodsList: floor2),
                      FloorTitle(picture_address: floor3Title),
                      FloorContent(floorGoodsList: floor3)
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

// 楼层
class FloorTitle extends StatelessWidget {
  final String picture_address;
  const FloorTitle({Key key, this.picture_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

// 楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow(), _otherGoods()],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[1]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[2]),
            _goodsItem(floorGoodsList[3]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4])
      ],
    );
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {},
        child: Image.network(goods['image']),
      ),
    );
  }
}
