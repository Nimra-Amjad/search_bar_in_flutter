import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> allUsers = [
    {'id': 1, 'name': 'nimra', 'age': 22},
    {'id': 2, 'name': 'ansa', 'age': 19},
    {'id': 3, 'name': 'bilal', 'age': 16},
    {'id': 4, 'name': 'rehan', 'age': 14},
    {'id': 5, 'name': 'amjad', 'age': 55},
    {'id': 6, 'name': 'naseem', 'age': 47},
    {'id': 7, 'name': 'sonia', 'age': 24},
    {'id': 8, 'name': 'maria', 'age': 22},
    {'id': 9, 'name': 'abdullah', 'age': 17},
  ];
  // This list holds the data for the list view
  List<Map<String, dynamic>> foundUsers = [];
  @override
  initState() {
    foundUsers = allUsers;
    super.initState();
  }

  List<Map<String, dynamic>> results = [];
  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword==null) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allUsers;
      print('222222222222222222222222222');
      print(results);
    } else {
      results = allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      print('000000000000000000000000000');
      print(results);
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: results != null
                  ? ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(foundUsers[index]["id"]),
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            results[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                          title: Text(results[index]['name'],
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                              '${results[index]["age"].toString()} years old',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
