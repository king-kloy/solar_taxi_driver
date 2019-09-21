import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScreenFour extends StatefulWidget {
  // ScreenFour({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _ScreenFourState createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  bool _isSwitched = true;
  String _status = 'Offline';

  // custom floating action buttons
  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context);
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          // google map goes here
          color: Colors.blue,
        ),
        Positioned(
          //Place it at the top, and not use the entire screen
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            //   leading: IconButton(
            //     onPressed: _drawer,
            //     icon: Icon(
            //       Icons.menu,
            //       color: Colors.white,
            //     ),
            //     iconSize: 45.0,
            //   ),
            title: Padding(
              padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
              child: Container(
                height: 30.0,
                width: 80.0,
                // margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    '$_status',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent, //No more green
            elevation: 0.0,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CupertinoSwitch(
                  activeColor: Colors.yellowAccent,
                  value: _isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitched = value;

                      _status = _isSwitched ? 'Online' : 'Offline';
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 340.0,
                ),
                button(_onMapTypeButtonPressed, Icons.my_location),
              ],
            ),
          ),
        ),
        Positioned(
          //Place it at the top, and not use the entire screen
          top: 390.0,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: 200,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // ListTile(
                  //   leading: CircleAvatar(
                  //     radius: 30.0,
                  //     backgroundImage: NetworkImage('assets/images/dope.jpg'),
                  //     backgroundColor: Colors.grey,
                  //   ),
                  //   title: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Text(
                  //         'Kumasi Hive',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, color: Colors.blue),
                  //       ),
                  //       Text(
                  //         'GHS 2.4',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.normal,
                  //             color: Colors.blue),
                  //       ),
                  //     ],
                  //   ),
                  //   subtitle: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Column(
                  //         children: <Widget>[
                  //           Container(
                  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(5.0),
                  //                 color: Colors.blue),
                  //             child: Text(
                  //               "Cash",
                  //               style: TextStyle(color: Colors.white),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //       Column(
                  //         children: <Widget>[
                  //           Text(
                  //             '3km',
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.normal,
                  //                 color: Colors.blue),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: Colors.yellow,
                          size: 30.0,
                        ),
                        Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://i.imgur.com/BoN9kdC.png")))),
                        Text('ongoing',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16.0))
                      ],
                    ),
                  ),
                  Text('Kumasi Hive',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '5.0',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        '100 Rides',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.blue),
                          ),
                        ),
                        SizedBox(width: 30.0),
                        FlatButton(
                            onPressed: () {
                              _onShowPaymentDialogue(context);
                            },
                            color: Colors.blue,
                            child: Text(
                              'Start Trip',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.transparent // transparency here
                ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onShowPaymentDialogue(BuildContext context) {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return
           AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              width: 260.0,
              height: 230.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // dialog top
                  Expanded(
                    child: Container(
                      // padding:  EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        'Please Pay',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
// dialog top// dialog top
                  Expanded(
                    child: Container(
                      // padding:  EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        'GHS 4.00',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      // padding:  EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        'to the Driver',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  // dialog bottom
                  FlatButton(
                      onPressed: () {
                        _onShowPaymentDialogue(context);
                      },
                      color: Colors.blue,
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)))
                ],
              ),
            ),
          );
        });
  }

  _onMapTypeButtonPressed() {}
}
