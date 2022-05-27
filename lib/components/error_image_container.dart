import 'package:flutter/material.dart';

import '../theme.dart';

class ErrorImageContainer extends StatelessWidget {
  const ErrorImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: anyaSecondaryWhiteColor,
        child: const Icon(Icons.error));
  }
}
