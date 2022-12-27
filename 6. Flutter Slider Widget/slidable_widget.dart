import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlideableWidget extends StatefulWidget {
  static const String id = "SlideableWidget";
  SlideableWidget({Key? key}) : super(key: key);

  @override
  State<SlideableWidget> createState() => _SlideableWidgetState();
}

class _SlideableWidgetState extends State<SlideableWidget> {
  showSnackbar() {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green, content: Text("Data updated")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Slidable"),
        backgroundColor: Color(0xff8639F9),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                slidableWidget(index: index),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: Divider(
                //     color: Colors.black,
                //   ),
                // ),
              ],
            );
          }),
    );
  }

  Widget slidableWidget({required int index}) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: (context) {
              showSnackbar();
            },
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            backgroundColor: Colors.blue,
            onPressed: (context) {
              showSnackbar();
            },
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Update',
          ),
        ],
      ),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xff8639F9),
            child: Text(
              index.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          subtitle: const Text('Description'),
          title: const Text('Title',
              style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
