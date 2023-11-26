import 'package:get/get.dart';

import '../controllers/genre_list_controller.dart';

class GenreListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GenreListController());
  }
}
