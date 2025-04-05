import 'package:flutter/material.dart';

class DismissKeyboardWrapper extends StatelessWidget {
  final Widget child;

  const DismissKeyboardWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
