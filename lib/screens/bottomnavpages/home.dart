import 'dart:math';

import 'package:classroommanager/models/subject.dart';
import 'package:classroommanager/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> filter = ['Yesterday', 'Today', 'Tomorrow'];
  String _selection = 'Today';
  bool more = true;

  Color selectedColour(int position) {
    Color c;
    if (position % 4 == 0) c = Color.fromRGBO(61, 127, 217, 1.0);
    if (position % 4 == 1) c = Color.fromRGBO(240, 184, 93, 1.0);
    if (position % 4 == 2) c = Color.fromRGBO(69, 169, 176, 1.0);
    if (position % 4 == 3) c = Color.fromRGBO(69, 169, 176, 1.0);
    return c;
  }

  Color organizerColour(int position) {
    Color c;
    if (position % 2 == 0) c = Color.fromRGBO(232, 103, 74, 1.0);
    if (position % 2 == 1) c = Colors.white;
    return c;
  }

  Color textColour(int position) {
    Color c;
    if (position % 2 == 1) c = Color.fromRGBO(232, 103, 74, 1.0);
    if (position % 2 == 0) c = Colors.white;
    return c;
  }

  @override
  Widget build(BuildContext context) {
    var _subjects = Provider.of<List<Subject>>(context);
    return Scaffold(
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: [
                SizedBox(height: 60.0),
                // profile pic
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/avc.png'),
                  ),
                    Stack(
                      children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/images/man.png'),
                        ),
                      ),
                      Positioned(
                        right: 1.0,
                        bottom: 1.0,
                        child: Container(
                          height: 12.0,
                          width: 12.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: Icon(Icons.circle, color: Colors.green, size: 10.0,)))
                        ],
                      )
                    ],
                ),

                // text message +
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: "Hello, ",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Poppins',
                                  color: Colors.black.withOpacity(0.8)),
                              children: [
                                TextSpan(
                                  text: "Samuel!",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontFamily: 'Poppins',
                                      color: Colors.red),
                                ),
                              ]),
                        ),
                      ),

                      IconButton(icon: Icon(Icons.add, color: Colors.teal.withOpacity(0.5), size: 30.0,), onPressed: () {})

                    ],
                  ),
                ),

                // container of cards
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.brown.withOpacity(0.2)
                    ),
                    child: Column(
                      children: [
                        // upcoming
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('UPCOMING', style: TextStyle(
                                  color: Colors.brown.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0
                              ),),

                              DropdownButtonHideUnderline(
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: DropdownButton(
                                    icon: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.blueGrey,),
                                    style: TextStyle(color: Colors.teal.withOpacity(0.5), fontSize: 13.0, fontFamily: 'Poppins'),
                                    items: filter.map((seleceted) {
                                      return DropdownMenuItem(
                                        child: Text(seleceted),
                                        value: seleceted,
                                      );
                                    }).toList(),
                                    onChanged: (newSelection) {
                                      setState(() {
                                        _selection = newSelection;
                                      });
                                    },
                                    value: _selection,
                                    // hint: Text('Filter', style: TextStyle(color: blue),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Divider(color: Colors.white.withOpacity(0.8), thickness: 3.0,),

                        // Cards list
                        _subjects == null ? Center(
                          child: SizedBox(
                              height: 80,
                              width: 80,
                              child: LoadingIndicator(
                                indicatorType: Indicator.ballClipRotateMultiple,
                                color: Colors.teal,
                              )
                          ),
                        ) :
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: more ? _subjects.length : 2,
                            itemBuilder: (context, index){
                            return Card(
                              elevation: 5.0,
                              margin: EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: selectedColour(index),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // subject name
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('${_subjects[index].subject}', style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500
                                            ),),

                                            _subjects[index].organizer ? Padding(
                                              padding: const EdgeInsets.only(left: 5.0),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                                                decoration: BoxDecoration(
                                                  color: organizerColour(index),
                                                  borderRadius: BorderRadius.circular(5.0),
                                                ),
                                                child: Center(
                                                  child: Text('Organizer', style: TextStyle(
                                                    color: textColour(index),
                                                    fontFamily: 'Poppins',
                                                    fontSize: 10.0
                                                  ),),
                                                ),
                                              ),
                                            ) : Container(),
                                          ],
                                        ),

                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 18.0,
                                            backgroundImage: NetworkImage(_subjects[index].urlAvatar),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // class name
                                    SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(_subjects[index].classname, style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400
                                        ),),

                                        Text(
                                          '${DateFormat('Hm').format(DateTime.now())} - ${DateFormat('jm').format(DateTime.now())}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 12.0
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                              // return Container(
                              //     height: 50,
                              //     color: Colors.grey[(index*200) % 400],
                              //     child: Center(
                              //         child: Text(
                              //             '${_subjects[index].classname} ${_subjects[index].subject}'
                              //         )
                              //     )
                              // );
                            }
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: IconButton(icon: more ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down), onPressed: () {
                            setState(() {
                              more = !more;
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ),

              ],
            ),
        )
    );
  }
}
