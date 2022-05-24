import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../data/repo/theme_provider.dart';
import '../theme.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (Provider.of<ThemeProvider>(context, listen: false).isDark
              ? Colors.grey[800]
              : anyaSecondaryWhiteColor),
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
