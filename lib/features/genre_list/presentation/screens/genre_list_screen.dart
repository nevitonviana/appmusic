import 'package:flutter/material.dart';

import '../../../../shared/widgets/screen_widget.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = "/genre-list";

  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      isLoading: false,
      title: "Lista de Generos",
      child: Container(),
    );
  }
}
