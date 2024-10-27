import 'package:flutter/material.dart';

class MyDataSource extends DataTableSource {
  @override
  int get rowCount => 100;

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      String name = 'Name ${index + 1}';

      return DataRow(
        cells: <DataCell>[
          DataCell(Text(name)),
        ],
      );
    }
    return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
