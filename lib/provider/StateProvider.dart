import 'package:flutter/material.dart';
import 'package:flutter_placeholder/enums/WidgetState.dart';

class StateProvider with ChangeNotifier {
  WidgetState _state = WidgetState.loading;

  WidgetState get state => _state;

  bool get isLoading => _state == WidgetState.loading;

  bool get isError => _state == WidgetState.error;

  bool get isEmpty => _state == WidgetState.empty;

  bool get isContent => _state == WidgetState.complete;

  _setViewState(WidgetState state) {
    this._state = state;
    notifyListeners();
  }

  setLoadingState() => _setViewState(WidgetState.loading);

  setEmptyState() => _setViewState(WidgetState.empty);

  setErrorState() => _setViewState(WidgetState.error);

  setCompleteState() => _setViewState(WidgetState.complete);
}
