import 'package:flutter/material.dart';

class ReorderList extends StatefulWidget {
  static const String id = "ReoderListDemo";

  List<String> item = [
    "Clients",
    "Designer",
    "Developer",
    "Director",
    "Employee",
    "Manager",
    "Worker",
    "Owner"
  ];
  @override
  _ReorderListState createState() => _ReorderListState();
}

class _ReorderListState extends State<ReorderList> {
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget.item.removeAt(oldindex);
      widget.item.insert(newindex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reorderd ListView"),
        backgroundColor: Color(0xff8639F9),
      ),
      backgroundColor: Colors.white,
      body: ReorderableListView(
        children: [
          for (final items in widget.item)
            Card(
              color: Color(0xff8639F9),
              key: ValueKey(items),
              elevation: 2,
              child: ListTile(
                title: Text(
                  items,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.work,
                  color: Colors.black,
                ),
              ),
            ),
        ],
        onReorder: reorderData,
      ),
    );
  }
}
