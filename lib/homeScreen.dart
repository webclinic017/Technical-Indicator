import 'package:flutter/material.dart';
import 'package:technical_indicator/assets.dart';
import 'package:technical_indicator/screens/average.dart';
import 'package:technical_indicator/screens/pivotPoint.dart';
import 'package:technical_indicator/screens/summary.dart';
import 'package:technical_indicator/screens/ti.dart';
import 'dataCenter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, String value}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = 2900;

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
            toolbarHeight: 150,
            brightness: Brightness.dark,
            backgroundColor: primaryColor,
            flexibleSpace: MyBar()),
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                height: height,
                child: Column(children: [
                  Summary(value: 'NEUTRAL'),
                  MovingAverage(),
                  TechnicalIndicator(),
                  PivotPoint()
                ]))));
  }
}

class MyBar extends StatefulWidget {
  @override
  _MyBarState createState() => _MyBarState();
}

class _MyBarState extends State<MyBar> {
  String _selected = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          margin: EdgeInsets.only(top: 35, left: 10),
          width: double.infinity,
          height: 70,
          child: Row(children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios_sharp, color: textColor),
                onPressed: () {}),
            Text("USD / INR",
                style: textDesigner(size: 21, weight: FontWeight.w500))
          ])),
      Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: bgContainer,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                  buttonColor: bgContainer,
                  alignedDropdown: true,
                  child: DropdownButton(
                      dropdownColor: bgContainer,
                      value: _selected,
                      onChanged: (newVal) {
                        setState(() {
                          _selected = newVal;
                        });
                      },
                      icon: Icon(Icons.expand_more_sharp, color: textColor),
                      items: barItemsList.map((item) {
                        return DropdownMenuItem(
                            value: item['id'],
                            child: Text(item['name'], style: textDesigner()));
                      }).toList()))))
    ]));
  }
}
