import 'package:flutter/material.dart';
import 'package:flutter_study_day7/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anyaSecondaryWhiteColor,
      body: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: anyaColor,
          rightDotColor: anyaBlackColor,
          size: 200,
        ),
      ),
    );
  }
}
