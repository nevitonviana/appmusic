import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/app/music_app_colors.dart';

import '../../features/genre_details/presentation/bindings/genre_details_bindings.dart';
import '../../features/genre_details/presentation/screens/genre_details_screen.dart';
import '../../features/genre_list/presentation/bindings/genre_list_bindings.dart';
import '../../features/genre_list/presentation/screens/genre_list_screen.dart';

class MusicAppMaterial {
  MusicAppMaterial._();

  static String get getTitle => "Music app - Flutter Bootcamp";

  static List<GetPage> get getPages => [
        GetPage(
          name: GenreListScreen.routeName,
          page: () => const GenreListScreen(),
          binding: GenreListBindings(),
          children: [
            GetPage(
              name: GenreDetailsScreen.routeName,
              page: () =>  const GenreDetailsScreen(),
              binding: GenreDetailsBindings(),
            ),
          ],
        ),
      ];

  static ThemeData get getTheme => ThemeData(
        primaryColor: MusicAppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MusicAppColors.primaryColor,
          titleTextStyle: TextStyle(
            color: MusicAppColors.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: "Nunito",
      );
}
