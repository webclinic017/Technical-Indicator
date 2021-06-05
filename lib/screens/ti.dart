import 'package:flutter/material.dart';

import '../assets.dart';
import '../dataCenter.dart';

class TechnicalIndicator extends StatefulWidget {
  @override
  _TechnicalIndicatorState createState() => _TechnicalIndicatorState();
}

class _TechnicalIndicatorState extends State<TechnicalIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 50, bottom: 20),
            child: Column(children: [
              Text("Technical Indicators", style: textDesigner(size: 20)),
              GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: indicator5,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text('STRONG SELL', style: textDesigner()))),
                  onTap: () {})
            ])),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Text('1', style: textDesigner(size: 18)),
                    Text('Buy',
                        style: textDesigner(size: 18, color: nonSelected))
                  ]),
                  Column(children: [
                    Text('1', style: textDesigner(size: 18)),
                    Text('Neutral',
                        style: textDesigner(size: 18, color: nonSelected))
                  ]),
                  Column(children: [
                    Text('9', style: textDesigner(size: 18)),
                    Text('Sell',
                        style: textDesigner(size: 18, color: nonSelected))
                  ])
                ])),
        buildDataTable(),
      ],
    ));
  }

  Widget buildDataTable() {
    return Container(
      width: double.infinity,
      child: DataTable(
        columnSpacing: 20,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => bgContainer),
        columns: getColumns(),
        rows: getRows(),
      ),
    );
  }

  List<DataColumn> getColumns() {
    return tiColumnItems
        .map((String header) => DataColumn(
            label: Text(header, style: textDesigner(color: nonSelected))))
        .toList();
  }

  List<DataRow> getRows() => technicalIndicatorList.map((item) {
        final cell = [item['name'], item['value'], item['action']];
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
          case 'LESS\nVOLATILE':
            tColor = nonSelected;
            break;
        }
        return DataCell(Text('$data', style: textDesigner(color: tColor)));
      }).toList();
}
