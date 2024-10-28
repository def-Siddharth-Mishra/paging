import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    final currentItems = _data.sublist(
      _startIndex,
      (_startIndex + 10 > _data.length) ? _data.length : _startIndex + 10,
    );

    final rangeStart = _startIndex + 1;
    final rangeEnd = _startIndex + currentItems.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paging Example'),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _previousPage,
                  child: const Text('Previous'),
                ),
                const SizedBox(width: 20),
                Text('$rangeStart to $rangeEnd'),
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
