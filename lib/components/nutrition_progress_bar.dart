import 'package:flutter/material.dart';
import 'package:noorish_app/models/nutrition_data.dart';
import 'package:noorish_app/style.dart';

class NutrientProgressBar extends StatelessWidget {
  final NutrientData data;

  NutrientProgressBar({required this.data});

  @override
  Widget build(BuildContext context) {
    // Wrap the progress bar and its label in a Padding widget
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(data.name,
                style:
                    Styles.baseTextStyle.copyWith(color: Styles.primaryColor)),
            Text('${data.currentValue.toInt()}',
                style:
                    Styles.baseTextStyle.copyWith(color: Styles.primaryColor)),
          ]),
          SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: data.currentValue / data.maxValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                  Styles.primaryColor // Or any color based on data
                  ),
              minHeight: 10, // Height of the progress bar
            ),
          ),
        ],
      ),
    );
  }
}
