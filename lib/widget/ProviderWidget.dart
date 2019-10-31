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
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  T provider;

  @override
  void initState() {
    provider = widget.provider;
    widget.onReady?.call(provider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: provider,
      child: Consumer<T>(
        child: widget.child,
        builder: widget.builder,
      ),
    );
  }
}
