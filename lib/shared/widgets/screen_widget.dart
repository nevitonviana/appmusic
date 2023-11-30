import 'package:flutter/material.dart';

import '../../core/app/music_app_colors.dart';
import 'app_music_error_widget.dart';
import 'text_widget.dart';

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
      body: ColoredBox(
          color: MusicAppColors.primaryColor,
          child: isLoading || error != null
              ? Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : AppMusicErrorWidget(
                          error: error!,
                        ),
                )
              : child),
    );
  }
}
