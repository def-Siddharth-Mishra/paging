import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PagingScreen extends StatefulWidget {
  const PagingScreen({super.key});

  @override
  State<PagingScreen> createState() => _PagingScreenState();
}

class _PagingScreenState extends State<PagingScreen> {
  int _startIndex = 0;
  final List<int> _data = List.generate(100, (index) => index + 1);

  void _nextPage() {
    setState(() {
      if (_startIndex + 10 < _data.length) {
        _startIndex += 10;
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_startIndex - 10 >= 0) {
        _startIndex -= 10;
      }
    });
  }

  void _goToPage(String page) {
    final currentPage = int.tryParse(page);
    if (currentPage != null) {
      setState(() {
        _startIndex = (currentPage - 1) * 10;
        if (_startIndex < 0) {
          _startIndex = 0;
        } else if (_startIndex >= _data.length) {
          _startIndex = (_data.length ~/ 10) * 10 - 10;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentItems = _data.sublist(
      _startIndex,
      (_startIndex + 10 > _data.length) ? _data.length : _startIndex + 10,
    );

    final currentPage = (_startIndex ~/ 10 + 1);
    // final rangeStart = _startIndex + 1;
    // final rangeEnd = _startIndex + currentItems.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paging Example'),
        // actions: [IconButton(onPressed: currentPage, icon: icon)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: currentItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item ${currentItems[index]}'),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Page $currentPage'),
                const SizedBox(width: 20),
                Text(
                    'Showing ${_startIndex + 1} - ${(_startIndex + currentItems.length)} of ${_data.length}'),
              ],
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _previousPage,
                  child: const Text('Previous'),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    keyboardType: TextInputType.number,
                    onChanged: _goToPage,
                    decoration: const InputDecoration(
                      hintText: 'Pages',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: _nextPage,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
