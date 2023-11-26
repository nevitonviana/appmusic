import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../features/genre_list/presentation/screens/genre_list_screen.dart';
import 'music_app_initial_bindings.dart';
import 'music_app_material.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MusicAppMaterial.getTitle,
      theme: MusicAppMaterial.getTheme,
      getPages: MusicAppMaterial.getPages,
      initialRoute: GenreListScreen.routeName,
      initialBinding: MusicAppInitialBindings(),
    );
  }
}
