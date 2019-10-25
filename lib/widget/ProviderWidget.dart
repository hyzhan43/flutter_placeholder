import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T provider;
  final Widget child;
  final Function(T) onReady;

  ProviderWidget({
    Key key,
    @required this.builder,
    @required this.provider,
    this.child,
    this.onReady,
  }) : super(key: key);

  @override
  _ProviderWidgetState createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget> {
  T provider;

  @override
  void initState() {
    super.initState();

    provider = widget.provider;

    if (widget.onReady != null) {
      widget.onReady(provider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => provider,
      child: Consumer<T>(
        child: widget.child,
        builder: widget.builder,
      ),
    );
  }
}
