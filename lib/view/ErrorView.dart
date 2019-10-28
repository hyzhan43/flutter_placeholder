import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder/provider/StateProvider.dart';
import 'package:provider/provider.dart';

class ErrorView<T extends StateProvider> extends StatelessWidget {
  final Function(T) onRetry;

  ErrorView({this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("网络异常, 请检查网络设置", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 10),
          Consumer<T>(
            builder: (context, provider, child) => FlatButton(
              color: Colors.grey,
              child: Text("点击重试", style: TextStyle(color: Colors.white)),
              onPressed: () => onRetry(provider),
            ),
          )
        ],
      ),
    );
  }
}
