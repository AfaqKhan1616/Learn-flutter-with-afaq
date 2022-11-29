import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class LiquidPullToRefreshDemo extends StatefulWidget {
  static const String id = "LiquidPullToRefreshDemo";
  const LiquidPullToRefreshDemo({Key? key}) : super(key: key);

  @override
  State<LiquidPullToRefreshDemo> createState() =>
      _LiquidPullToRefreshDemoState();
}

class _LiquidPullToRefreshDemoState extends State<LiquidPullToRefreshDemo> {
  @override
  Widget build(BuildContext context) {
    int items = 4;
    int colorIndex = 0;
    List<Color> colors = [
      Color(0xff8639F9),
      Color(0xffCBB3EF),
      Color(0xff8639F9),
      Color(0xffCBB3EF),
      Color(0xff8639F9),
      Colors.orange,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Liquid Pull To Refresh"),
        backgroundColor: Color(0xff8639F9),
      ),
      backgroundColor: Colors.white,
      // Gray (#606060FF) and Lime Punch (#D6ED17FF)
      body: SafeArea(
          child: LiquidPullToRefresh(
        onRefresh: () async {
          items++;
          colorIndex++;
          if (items == colors.length) {
            colorIndex = 0;
          }
          print(items);

          setState(() {});
        },
        showChildOpacityTransition: false,
        height: 100,
        color: Colors.lime,
        backgroundColor: Colors.green,
        springAnimationDurationInMilliseconds: 700,
        borderWidth: 3.0,
        animSpeedFactor: 1.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView(
            children: [
              for (int i = 0; i < items; i++)
                rectangle(context, colors[colorIndex++]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_downward_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Text(
                    "Pull down to refresh",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget rectangle(BuildContext context, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 100,
      ),
    );
  }
}
