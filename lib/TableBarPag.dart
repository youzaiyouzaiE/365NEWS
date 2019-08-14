import 'package:flutter/material.dart';
import 'package:t_s_f_news/Home/HomePage.dart';
import 'package:t_s_f_news/Video/videoPage.dart';
import 'package:t_s_f_news/Mine/MinePage.dart';


class TableBarPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TabBarState();
  }
}


//// TabBarView
class TabBarState extends State <TableBarPage> {
  int _selectedItem = 0;
  List<Widget> pages = List<Widget>();

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    initPages();
    return Scaffold(
      body: IndexedStack(
        index: _selectedItem,
        children:pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          _getBottomNavBarItem(Icons.home, "首页", _barColor(0,context)),
          _getBottomNavBarItem(Icons.video_library, "视频", _barColor(1,context)),
          _getBottomNavBarItem(Icons.person, "我的", _barColor(2,context)),
        ],
        currentIndex: _selectedItem,
        onTap:(int index){
          setState(() {
            _selectedItem = index;
          }
          );
        },
      ),
    );
  }

  void initPages() {
    pages..add(HomePage())
        ..add(VideoPage())
        ..add(MinePage());
  }

  BottomNavigationBarItem _getBottomNavBarItem(IconData iconData, String title, Color color) {
    return BottomNavigationBarItem (
      icon:Icon(iconData, color:color),
      title:Text(title, style: TextStyle(color: color),),
    );
  }

  Color _barColor(int barIndex, BuildContext context) {
    return  barIndex == _selectedItem ? Theme.of(context).primaryColor : Colors.grey;
  }
}

