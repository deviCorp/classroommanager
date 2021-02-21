import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('NOTIFICATIONS', style: TextStyle(
                  color: Colors.brown,
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600
                ),),
                
                Stack(
                  children: [
                    Icon(Icons.notifications, color: Colors.black,size: 30,),
                    Positioned(
                        right: 1.0,
                        top: 1.0,
                        child: Container(
                            height: 12.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                            child: Icon(Icons.circle, color: Colors.red, size: 10.0,)))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
