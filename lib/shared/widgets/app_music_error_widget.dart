import 'package:flutter/material.dart';

import 'button_widget.dart';
import 'text_widget.dart';

class AppMusicErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback? onTryAgain;

  const AppMusicErrorWidget({super.key, required this.error, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          error,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        if (onTryAgain != null)
          ButtonWidget(
            title: 'Tente novamente',
            onPressed: onTryAgain!,
          ),
      ],
    );
  }
}
