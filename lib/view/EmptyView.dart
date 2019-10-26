import 'package:flutter/material.dart';
import 'package:flutter_placeholder/constant/ColorRes.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("空空如也  ：) ")
        ],
      ),
    );
  }
}
