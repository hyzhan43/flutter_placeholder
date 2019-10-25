import 'package:flutter/material.dart';
import 'package:flutter_placeholder/constant/ColorRes.dart';


class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(Color(ColorRes.primary)),
      ),
    );
  }
}
