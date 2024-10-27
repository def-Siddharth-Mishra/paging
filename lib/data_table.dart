import 'package:flutter/material.dart';
import 'package:paging/dummy_data.dart';

final DataTableSource dataSource = MyDataSource();

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Table Example')),
      body: PaginatedDataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Name')),
        ],
        source: dataSource,
        rowsPerPage: 10,
      ),
    );
  }
}
