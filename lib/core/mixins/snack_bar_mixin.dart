import 'package:get/get.dart';

import '../app/music_app_colors.dart';

mixin SnackBarMixin {
  void showErrorSnackBar(String description) {
    Get.snackbar("Erro", description,
        colorText: MusicAppColors.secondaryColor,
        backgroundColor: MusicAppColors.errorColor);
  }
}
