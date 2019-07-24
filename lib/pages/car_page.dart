import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/car.dart';
import './car/car_item.dart';
import './car/car_bottom.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: FutureBuilder(
        future: _getCarInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List carList = Provide.value<CarProvide>(context).carList;
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: carList.length,
                  itemBuilder: (context, index) {
                    return CarItem(carList[index]);
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CarBottom(),
                )
              ],
            );
          } else {
            return Text("正在加载");
          }
        },
      ),
    );
  }

  Future<String> _getCarInfo(BuildContext context) async {
    await Provide.value<CarProvide>(context).getCarInfo();
    return 'end';
  }
}
