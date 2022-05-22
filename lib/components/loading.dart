import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theme.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: dark <> light
      // backgroundColor: anyaSecondaryWhiteColor,
      backgroundColor: Colors.grey[800],
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
