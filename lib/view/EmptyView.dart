import 'package:flutter/material.dart';
import 'package:flutter_placeholder/constant/ColorRes.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network("http://b-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.jpeg"),
    );
  }
}
