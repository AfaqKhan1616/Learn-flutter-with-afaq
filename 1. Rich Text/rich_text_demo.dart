import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextDemo extends StatelessWidget {
  static const String id = "RichTextDemo";
  const RichTextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rich Text in flutter"),
        backgroundColor: Colors.black87,
      ),
      body: Container(
          color: Colors.black,
          padding: EdgeInsets.all(10),
          child: Center(
              child: RichText(
            text: const TextSpan(
                text: 'This ',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: 'is',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                      text: ' some ',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 30,
                          fontStyle: FontStyle.italic)),
                  TextSpan(
                    text: 'text.',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough),
                  ),
                ]),
          ))),
    );
  }
}
