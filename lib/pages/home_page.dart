import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            builder: (context,snapshot){
              if(snapshot.hasData){
                var data=json.decode(snapshot.data.toString());
                List<Map> swiper=(data['data']['slides'] as List).cast();
                List<Map> navgatorList=(data['data']['category'] as List).cast();
                String adPicture=data['data']['advertesPicture']['PICTURE_ADDRESS'];
                return Column(
                  children: <Widget>[
                    SwiperDiy(swiperDateList:swiper),
                    TopNavigator(navgatorList:navgatorList),
                    AdBanner(adPicture:adPicture)
                  ],
                );
              }else{
                return Center(
                  child: Text("加载中"),
                );
              }
            },
          )
          ),
    );
  }
}

// 轮播图
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;
  SwiperDiy({Key key,this.swiperDateList}):super(key:key);

  @override
  Widget build(BuildContext context) {
   

    print('设备的像素密度:${ScreenUtil.pixelRatio}');
    print('设备的高:${ScreenUtil.screenHeight}');
    print('设备的宽:${ScreenUtil.screenWidth}');

    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setHeight(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDateList[index]['image']}",fit: BoxFit.fill,);
        },
        itemCount:swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}


// 网格
class TopNavigator extends StatelessWidget {
  final List navgatorList;
  const TopNavigator({Key key,this.navgatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: (){print("点击了");},
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width:ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    if(this.navgatorList.length>10){
      this.navgatorList.removeRange(10, this.navgatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(280),
      padding:EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navgatorList.map((item){
          return _gridViewItemUI(context,item);
        }).toList(),
      ),
    );
  }
}

// 广告位
class AdBanner extends StatelessWidget {
  final String adPicture;
  const AdBanner({Key key,this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}









// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController typeController=TextEditingController();
//   String showText="欢迎你来到这里!";
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("美好人间"),
//         ),
//         body:SingleChildScrollView(
//         child:Container(
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: typeController,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(10.0),
//                   labelText: "美女类型",
//                   helperText: '请输入你喜欢的类型'
//                 ),
//                 autofocus: false,
//               ),
//               RaisedButton(
//                 onPressed: _choiceAction,
//                 child: Text("选择完毕"),
//               ),
//               Text(
//                 showText,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               )
//             ],
//           ),
//         ),
//         )
//       ),
//     );
//   }

//   void _choiceAction(){
//     print("开始选择");
//     if(typeController.text.toString()==''){
//       showDialog(
//         context: context,
//         builder: (context)=>AlertDialog(title:Text("美女类型不能为空"))
//       );
//     }else{
//       getHttp(typeController.text.toString()).then((val){
//         setState(() {
//           showText=val['data']['name'].toString();
//         });
//       });
//     }
//   }

//   Future getHttp(String TypeText) async{
//      try {
//       Response response;
//       var data={"name":TypeText};
//       response = await Dio().get(
//           "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
//           queryParameters: data
//           );
//       return response.data;
//     } catch (e) {
//       return print(e);
//     }
//   }

//   // Future getHttp(String TypeText)async{
//   //   try{
//   //     Response response;
//   //     var data={'name':TypeText};
//   //     response = await Dio().post(
//   //       "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/post_dabaojian",
//   //         queryParameters:data
//   //     );
//   //     return response.data;
//   //   }catch(e){
//   //     return print(e);
//   //   }
//   // }
// }
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String showText='还没数据';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text("首页"),),
//         body:SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: _btn,
//                 child: Text("请求数据"),
//               ),
//               Text(showText)
//             ],
//           ),
//         )
//       ),
//     );
//   }
//   void _btn(){
//     print("开始获取极客数据");
//     getHttp().then(
//       (val){
//         setState(() {
//           showText=val['data']['name'].toString();
//         });

//       }
//     );
//   }
//   Future getHttp()async{
//     try{
//       Response response;
//       Dio dio=new Dio();
//       dio.options.headers=httpHeaders;
//       response=await dio.get("https://time.geekbang.org/serv/v1/column/newAll");
//       print(response);
//       return response;
//     }catch(e){
//       return e;
//     }
//   }
// }