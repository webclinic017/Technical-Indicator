import 'package:flutter/material.dart';

import '../assets.dart';
import '../dataCenter.dart';

class PivotPoint extends StatefulWidget {
  @override
  _PivotPointState createState() => _PivotPointState();
}

class _PivotPointState extends State<PivotPoint> {
  String _selected = '1';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 50, bottom: 20),
            child: Text("Pivot Points", style: textDesigner(size: 20))),
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
                        items: ppItems.map((item) {
                          return DropdownMenuItem(
                              value: item['id'],
                              child: Text(item['name'], style: textDesigner()));
                        }).toList())))),
        buildDataTable()
      ],
    ));
  }

  Widget buildDataTable() {
    return DataTable(
      columnSpacing: 60,
      columns: getColumns(),
      rows: getRows(),
    );
  }

  List<DataColumn> getColumns() {
    return ppColumnItems
        .map((String header) => DataColumn(
            label: Text(header, style: textDesigner(color: nonSelected))))
        .toList();
  }

  List<DataRow> getRows() => ppList.map((item) {
        final cell = [item['name'], item['value']];
        return DataRow(cells: getCells(cell));
      }).toList();

  List<DataCell> getCells(List cells) => cells.map((data) {
        return DataCell(Text('$data', style: textDesigner()));
      }).toList();
}
