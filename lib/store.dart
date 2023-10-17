import 'package:flutter/material.dart';

class Store with ChangeNotifier {
  String _mainPageData;
  String _secondaryPageData;

  String get mainPageData {
    return _mainPageData;
  }

  String get secondaryPageData {
    return _secondaryPageData;
  }

  void updateMainPageData(String data) {
    _mainPageData = data;
  }

  void updateSencondaryPageData(String data) {
    _secondaryPageData = data;
  }
}
