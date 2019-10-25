import 'package:flutter/material.dart';

import 'constant/ColorRes.dart';

class LoadingView extends StatelessWidget {
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
