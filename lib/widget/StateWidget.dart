import 'package:flutter/material.dart';
import 'package:flutter_placeholder/provider/StateProvider.dart';
import 'package:flutter_placeholder/view/LoadingView.dart';

import '../view/EmptyView.dart';
import '../view/ErrorView.dart';
import 'ProviderWidget.dart';

class StateWidget<T extends StateProvider> extends StatefulWidget {
  final T provider;
  final Widget child;
  final Function(T) onReady;
  final Function(T) onRetry;
  final ValueWidgetBuilder<T> builder;

  final Widget loading;
  final Widget error;
  final Widget empty;

  StateWidget({
    Key key,
    @required this.builder,
    this.provider,
    this.onReady,
    this.onRetry,
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

  Function(T) onRetry;

  @override
  void initState() {
    super.initState();

    provider = widget.provider ?? StateProvider();
    onRetry = widget.onRetry ?? widget.onReady;

    widget.onReady?.call(provider);
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
    } else if (provider.isComplete) {
      return widget.builder(context, provider, child);
    } else if (provider.isEmpty) {
      return widget.empty ?? EmptyView();
    } else {
      return widget.error ?? ErrorView<T>(onRetry: onRetry);
    }
  }
}
