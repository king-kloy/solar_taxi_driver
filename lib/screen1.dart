import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:solar_taxi_driver/screen3.dart';

import './MapSample.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  bool _isSwitched = false;
  String _status = 'Offline';

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // google map goes here
            child: MapSample(),
          ),
          
          
          new Positioned(
            //Place it at the top, and not use the entire screen
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              leading: IconButton(
                onPressed: _drawer,
                icon: Icon(
                  Icons.menu,
                  color: Colors.blue,
                ),
                iconSize: 40.0,
              ),
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
                    ))),
              ),
              backgroundColor: Colors.transparent, //No more green
              elevation: 0.0,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CupertinoSwitch(
                    activeColor: Colors.blue,
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
           SizedBox(height: 50,),
          InkWell(child: Icon(Icons.donut_small), onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScreenThree()));
          },)
          
        ],
      ),
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

  _drawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          )
        ],
      ),
    );
  }

}
