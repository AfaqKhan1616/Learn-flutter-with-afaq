import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaySliderNotifier extends ChangeNotifier {
  String id = "StaySliderNotifier";
  List<String> ratings = ["🚀", "🔥", "👍🏻", "😒", "👎🏻"];

  bool isRatingChanged = false;
  setRatingChanged({required bool value}) {
    isRatingChanged = value;
    notifyListeners();
    debugPrint(isRatingChanged.toString());
  }

  String selectedRating = "🚀";
  double ratingValue = 0;
  setRatingValue({required double val}) {
    ratingValue = val;
    notifyListeners();
    if (ratingValue > 0 && ratingValue < .2) {
      selectedRating = ratings[4];
    } else if (ratingValue > .2 && ratingValue < .4) {
      selectedRating = ratings[3];
    } else if (ratingValue > .4 && ratingValue < .6) {
      selectedRating = ratings[2];
    } else if (ratingValue > .6 && ratingValue < .8) {
      selectedRating = ratings[1];
    } else if (ratingValue > .8) {
      selectedRating = ratings[0];
    }
    notifyListeners();
    debugPrint(ratingValue.toString());
  }
}

class FlutterExperienceSliderWidget extends StatelessWidget {
  FlutterExperienceSliderWidget({Key? key}) : super(key: key);
  static const String id = "FlutterExperienceSliderWidget";

  @override
  Widget build(BuildContext context) {
    StaySliderNotifier staySliderNotifier({required bool renderUI}) =>
        Provider.of<StaySliderNotifier>(context, listen: renderUI);

    String selectedEmoji = staySliderNotifier(renderUI: true).selectedRating;
    double ratingValue = staySliderNotifier(renderUI: true).ratingValue;
    bool isRatingChanged = staySliderNotifier(renderUI: true).isRatingChanged;

    Widget staySlider() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 100,
              child: AnimatedScale(
                duration: const Duration(seconds: 1),
                scale: isRatingChanged ? 1.1 : 0.8,
                child: Text(selectedEmoji,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isRatingChanged ? 60 : 45)),
              ),
            ),
            SizedBox(
                width: 300,
                child: Slider(
                    activeColor: Color(0xff8639F9),
                    inactiveColor: Colors.black,
                    min: 0,
                    max: 1,
                    value: ratingValue,
                    onChangeEnd: (val) {
                      staySliderNotifier(renderUI: false)
                          .setRatingChanged(value: true);
                    },
                    onChangeStart: (val) {
                      staySliderNotifier(renderUI: false)
                          .setRatingChanged(value: false);
                    },
                    onChanged: (val) {
                      staySliderNotifier(renderUI: false)
                          .setRatingValue(val: val);
                    }))
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xff8639F9),
          title: const Text("Flutter Stay Slider",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Rate your stay",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                    Center(child: staySlider())
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 5, color: Color(0xff8639F9)),
                  borderRadius: BorderRadius.circular(25)),
            ),
          )
        ],
      ),
    );
  }
}
