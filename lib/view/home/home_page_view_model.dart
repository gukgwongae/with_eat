import 'package:flutter/material.dart';
import 'package:with_eat/view/chat/chat_page.dart';
import 'package:with_eat/view/home/home_page.dart';
import 'package:with_eat/view/my/my_page.dart';

class HomePageViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final List<Widget> pages = [HomePage(), ChatPage(), MyPage()];

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
