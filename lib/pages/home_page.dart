import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      appBar: AppBar(
        title:Text("首页"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("首页"),
      ),
    );
  }

  void getHttp() async {
    try {
      Response response;
      response = await Dio().get(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=长腿美女");
      return print(response);
    } catch (e) {
      return print(e);
    }
  }
}
