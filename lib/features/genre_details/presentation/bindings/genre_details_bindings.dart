import 'package:get/get.dart';

import '../controllers/genre_details_controller.dart';

class GenreDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(GenreDetailsController);
  }

}