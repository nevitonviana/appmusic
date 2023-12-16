import 'package:flutter/material.dart';

import '../../../../shared/models/genre_model.dart';
import '../../../../shared/widgets/image_widget.dart';
import '../../../../shared/widgets/text_widget.dart';
import '/core/extensions/media_query_extension.dart';

class GenreDetailsAppWidget extends StatelessWidget {
  final GenreModel genre;

  const GenreDetailsAppWidget({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.getWidth / 1.5,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: context.getWidth / 3 - 12),
        title: TextWidget.title(genre.title),
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Hero(
          tag: genre.title,
          child: ImageWidget(
            width: context.getWidth,
            height: context.getHeight / 1.5,
            img: genre.img,
          ),
        ),
      ),
    );
  }
}
