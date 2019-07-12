import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'dart:convert';
import './home/swiper.dart';
import './home/top_navigator.dart';
import './home/advertise.dart';
import './home/leader.dart';
import './home/product.dart';
import './home/floor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [];
  // 保持状态
  @override
  bool get wantKeepAlive => true;
  var formData = {'lon': '115.02932', 'lat': '35.76189'};
  String homePageContent = "正在获取数据";

  @override
  void initState() {
    // request('homePageContext',formData:formData).then((val) {
    //   setState(() {
    //     homePageContent = val.toString();
    //   });
    // });
    super.initState();
    _getHotGoods();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("百姓生活+")),
          body: FutureBuilder(
            future: request('homePageContext', formData: formData),
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
                      FloorContent(floorGoodsList: floor3),
                      _hotGoods()
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

  void _getHotGoods() {
    var formData = {'page': page};
    request('homePageBelowConten', formData: formData).then((val) {
      print("--------++object--------${val}");
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text("火爆专区"),
  );
//列表
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(val['image'], width: ScreenUtil().setWidth(370)),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26.0)),
                ),
                Row(
                  children: <Widget>[
                    Text('¥${val['mallPrice']}'),
                    Text(
                      '¥${val['price']}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('暂无数据');
    }
  }

  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[hotTitle, _wrapList()],
      ),
    );
  }
}

// class HotGoods extends StatefulWidget {
//   @override
//   _HotGoodsState createState() => _HotGoodsState();
// }

// class _HotGoodsState extends State<HotGoods> {
//   @override
//   void initState() {
//     super.initState();
//     request('homePageBelowConten',formData: '1').then((val){
//       print("--------++object--------${val}");
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
