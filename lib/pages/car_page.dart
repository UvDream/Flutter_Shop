import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';
class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'),),
        body: Center(
          child: Column(
            children: <Widget>[
              Number(),
              MyButton()
            ],
          ),
        ),
    );
  }
}
class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Provide<Counter>(builder: (context,child,counter){
        return Text(
          '${counter.value}',
          style: Theme.of(context).textTheme.display1,
          );
      },)
    );
  }
}
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增'),
      ),
    );
  }
}