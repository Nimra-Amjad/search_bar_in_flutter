import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  List<String> _data = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
  // List<Map<String, dynamic>> allusers = [
  //   {'id': 1, 'name': 'nimra', 'age': 22},
  //   {'id': 2, 'name': 'ansa', 'age': 19},
  //   {'id': 3, 'name': 'bilal', 'age': 16},
  //   {'id': 4, 'name': 'rehan', 'age': 14},
  //   {'id': 5, 'name': 'amjad', 'age': 55},
  //   {'id': 6, 'name': 'naseem', 'age': 47},
  //   {'id': 7, 'name': 'sonia', 'age': 24},
  //   {'id': 8, 'name': 'maria', 'age': 22},
  //   {'id': 9, 'name': 'abdullah', 'age': 17},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _data
                  .where((item) =>
                      item.toLowerCase().contains(_searchQuery.toLowerCase()))
                  .map((item) => ListTile(
                        title: Text(item),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
