import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("网络异常, 请检查网络设置", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          FlatButton(
            color: Colors.grey,
            child: Text("点击重试", style: TextStyle(color: Colors.white)),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
