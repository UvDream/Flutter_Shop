import 'package:flutter/material.dart';
import '../config/httpHeaders.dart';
import '../service/service_method.dart';
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
          body: SingleChildScrollView(
            child: Text(homePageContent),
          )),
    );
  }
}
