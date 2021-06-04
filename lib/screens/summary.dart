import 'package:flutter/material.dart';

import '../assets.dart';
import '../shape.dart';

class Summary extends StatefulWidget {
  Summary({Key key, @required String value})
      : _value = value,
        super(key: key);
  final _value;

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    double i1Width = 10,
        i2Width = 10,
        i3Width = 10,
        i4Width = 10,
        i5Width = 10,
        _bottomOffset = 0,
        _topOffset = 10;
    String displayText;
    Color indicatorColor;
    Alignment position;

    switch (widget._value) {
      case 'STRONG BUY':
        displayText = widget._value;
        indicatorColor = indicator1;
        i1Width = 15;
        position = Alignment.topCenter;
        _topOffset = 20;
        break;

      case 'BUY':
        displayText = widget._value;
        indicatorColor = indicator2;
        i2Width = 15;
        position = Alignment.topCenter;
        _topOffset = 90;
        break;

      case 'NEUTRAL':
        displayText = widget._value;
        indicatorColor = indicator3;
        i3Width = 15;
        position = Alignment.center;
        break;
      case 'SELL':
        displayText = widget._value;
        indicatorColor = indicator4;
        i4Width = 15;
        position = Alignment.bottomCenter;
        _bottomOffset = 70;
        break;
      case 'STRONG SELL':
        displayText = widget._value;
        indicatorColor = indicator5;
        i5Width = 15;
        position = Alignment.bottomCenter;
        _topOffset = 10;
        break;
    }

    return Container(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text("Summary", style: textDesigner(size: 20)))),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(children: [
                    Column(children: [
                      Indicator(
                          width: i1Width,
                          fillColor: indicator1,
                          topLeftRadius: 10,
                          topRightRadius: 10),
                      Indicator(width: i2Width, fillColor: indicator2),
                      Indicator(
                        width: i3Width,
                        fillColor: indicator3,
                      ),
                      Indicator(width: i4Width, fillColor: indicator4),
                      Indicator(
                          width: i5Width,
                          fillColor: indicator5,
                          bottomLeftRadius: 10,
                          bottomRightRadius: 10)
                    ]),
                    Container(
                      alignment: position,
                      height: 400,
                      child: Container(
                          margin: EdgeInsets.only(
                              top: _topOffset, bottom: _bottomOffset, left: 20),
                          width: 130,
                          height: 70,
                          decoration: ShapeDecoration(
                              color: indicatorColor, shape: TypeIndicator()),
                          child: Center(
                              child: Text(displayText,
                                  style: textDesigner(color: primaryColor)))),
                    )
                  ]))
            ]),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Column(children: [
                  Options(displayText: '1 MIN', selected: true),
                  Options(displayText: '5 MIN'),
                  Options(displayText: '15 MIN'),
                  Options(displayText: '30 MIN'),
                  Options(displayText: '1 HR'),
                  Options(displayText: '5 HR'),
                  Options(displayText: '1 DAY'),
                  Options(displayText: '1 WK'),
                  Options(displayText: '1 M0N'),
                ]))
          ]),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final double _width,
      _topLeftRadius,
      _topRightRadius,
      _bottomLeftRadius,
      _bottomRightRadius;
  final Color _fillColor;
  Indicator(
      {Key key,
      @required double width,
      double topLeftRadius = 0,
      double topRightRadius = 0,
      double bottomLeftRadius = 0,
      double bottomRightRadius = 0,
      @required Color fillColor})
      : _width = width,
        _topLeftRadius = topLeftRadius,
        _topRightRadius = topRightRadius,
        _bottomLeftRadius = bottomLeftRadius,
        _bottomRightRadius = bottomRightRadius,
        _fillColor = fillColor,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool _selected = _width == 15 ? true : false;
    return Container(
        width: _width,
        height: 80,
        decoration: BoxDecoration(
            color: _fillColor,
            borderRadius: _selected
                ? BorderRadius.all(Radius.circular(3))
                : BorderRadius.only(
                    topLeft: Radius.circular(_topLeftRadius),
                    topRight: Radius.circular(_topRightRadius),
                    bottomLeft: Radius.circular(_bottomLeftRadius),
                    bottomRight: Radius.circular(_bottomRightRadius))));
  }
}

class Options extends StatelessWidget {
  Options({Key key, bool selected = false, @required String displayText})
      : _selected = selected,
        _displayText = displayText,
        super(key: key);

  final bool _selected;
  final String _displayText;

  @override
  Widget build(BuildContext context) {
    final _color = _selected ? textColor : nonSelected;

    return Container(
        width: 100,
        height: 45,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            border: Border.all(color: _color),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
            child: Text(
          _displayText,
          style: TextStyle(color: _color, fontFamily: 'IBM', fontSize: 16),
        )));
  }
}
