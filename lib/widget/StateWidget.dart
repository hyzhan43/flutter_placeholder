import 'package:flutter/material.dart';
import 'package:flutter_placeholder/provider/StateProvider.dart';

import '../EmptyView.dart';
import '../ErrorView.dart';
import '../LoadingView.dart';
import 'ProviderWidget.dart';

class StateWidget<T extends StateProvider> extends StatefulWidget {
  final T provider;
  final Widget child;
  final Function(T) onReady;
  final ValueWidgetBuilder<T> builder;

  final Widget loading;
  final Widget error;
  final Widget empty;

  StateWidget({
    Key key,
    @required this.builder,
    this.provider,
    this.onReady,
    this.child,
    this.loading,
    this.error,
    this.empty,
  }) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState<T>();
}

class _StateWidgetState<T extends StateProvider> extends State<StateWidget> {
  T provider;

  @override
  void initState() {
    super.initState();

    provider = widget.provider ?? StateProvider();

    if (widget.onReady != null) {
      widget.onReady(provider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      provider: provider,
      builder: _buildContent,
      child: widget.child,
    );
  }

  Widget _buildContent(BuildContext context, T provider, Widget child) {
    if (provider.isLoading) {
      return widget.loading ?? LoadingView();
    } else if (provider.isContent) {
      return widget.builder(context, provider, child);
    } else if (provider.isEmpty) {
      return widget.empty ?? EmptyView();
    } else {
      return widget.error ?? ErrorView();
    }
  }
}
