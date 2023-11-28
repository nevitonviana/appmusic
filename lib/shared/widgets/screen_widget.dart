import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final String title;
  final Widget child;
  final VoidCallback? onTryAgain;

  const ScreenWidget(
      {super.key,
      required this.isLoading,
      this.error,
      required this.title,
      required this.child,
      this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget.bold(title),
      ),
    );
  }
}
