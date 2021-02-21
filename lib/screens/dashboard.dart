import 'package:classroommanager/helpers/fadeanimation.dart';
import 'package:classroommanager/screens/bottomnavpages/board.dart';
import 'package:classroommanager/screens/bottomnavpages/home.dart';
import 'package:classroommanager/screens/bottomnavpages/notification.dart';
import 'package:classroommanager/screens/bottomnavpages/sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color red = Color.fromRGBO(255, 110, 99, 1.0);

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
        pageIndex,
        duration: Duration(microseconds: 50),
        curve: Curves.easeInOut);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Home(),
          Board(),
          NotificationPage(),
          Sheet(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: CupertinoTabBar(
            currentIndex: pageIndex,
            onTap: onTap,
            activeColor: red,
            iconSize: 22.0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.widgets_sharp),
                  activeIcon: FadeAnimation(
                    0.1, Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.widgets_sharp),
                      Icon(Icons.remove)
                    ],
                  ),
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.airplay_sharp),
                  activeIcon: FadeAnimation(
                    0.1, Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.airplay_sharp),
                      Icon(Icons.remove)
                    ],
                  ),
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.thumb_up_alt),
                  activeIcon: FadeAnimation(
                    0.1, Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.thumb_up),
                      Icon(Icons.remove)
                    ],
                  ),
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wysiwyg),
                  activeIcon: FadeAnimation(
                    0.1, Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.wysiwyg),
                      Icon(Icons.remove)
                    ],
                  ),
                  )
              ),
            ]
        ),
      ),
    );
  }
}
