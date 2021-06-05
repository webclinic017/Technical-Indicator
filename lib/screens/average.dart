import 'package:flutter/material.dart';

import '../assets.dart';
import '../dataCenter.dart';

class MovingAverage extends StatefulWidget {
  @override
  _MovingAverageState createState() => _MovingAverageState();
}

class _MovingAverageState extends State<MovingAverage> {
  String _selected = '1';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 50, bottom: 20),
            child: Column(children: [
              Text("Moving Averages", style: textDesigner(size: 20)),
              GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: indicator1,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(child: Text('BUY', style: textDesigner()))),
                  onTap: () {})
            ])),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Text('7', style: textDesigner(size: 18)),
                    Text('Buy',
                        style: textDesigner(size: 18, color: nonSelected))
                  ]),
                  Column(children: [
                    Text('-', style: textDesigner(size: 18)),
                    Text('Neutral',
                        style: textDesigner(size: 18, color: nonSelected))
                  ]),
                  Column(children: [
                    Text('5', style: textDesigner(size: 18)),
                    Text('Sell',
                        style: textDesigner(size: 18, color: nonSelected))
                  ])
                ])),
        Container(
            height: 50,
            margin: EdgeInsets.only(bottom: 20),
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
                        items: maItemsList.map((item) {
                          return DropdownMenuItem(
                              value: item['id'],
                              child: Text(item['name'], style: textDesigner()));
                        }).toList())))),
        buildDataTable()
      ],
    ));
  }

  Widget buildDataTable() {
    return Container(
      width: double.infinity,
      child: DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => bgContainer),
        columns: getColumns(),
        rows: getRows(),
      ),
    );
  }

  List<DataColumn> getColumns() {
    return maColumnItems
        .map((String header) => DataColumn(
            label: Text(header, style: textDesigner(color: nonSelected))))
        .toList();
  }

  List<DataRow> getRows() => movingAverageList.map((item) {
        final cell = [item['period'], item['value'], item['type']];
        return DataRow(cells: getCells(cell));
      }).toList();

  List<DataCell> getCells(List cells) => cells.map((data) {
        Color tColor = textColor;
        switch (data) {
          case 'SELL':
            tColor = indicator5;
            break;
          case 'NEUTRAL':
            tColor = indicator3;
            break;
          case 'BUY':
            tColor = indicator1;
            break;
        }
        return DataCell(Text('$data', style: textDesigner(color: tColor)));
      }).toList();
}
