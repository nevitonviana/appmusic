import 'package:flutter/material.dart';

import '../../../../../models/music_model.dart';
import '../../../../../widgets/image_widget.dart';
import '../../../../../widgets/text_widget.dart';

class MusicPlayerWidget extends StatelessWidget {
  final MusicModel music;

  const MusicPlayerWidget({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (_, constraints) => ImageWidget(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            img: music.img,
          ),
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.topLeft,
          child: TextWidget.title(music.title),
        ),
        
      ],
    );
  }
}
