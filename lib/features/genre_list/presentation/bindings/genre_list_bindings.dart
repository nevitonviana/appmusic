import 'package:get/get.dart';

import '../../../../core/services/api_service.dart';
import '../../data/repositories/genre_list_repository.dart';
import '../controllers/genre_list_controller.dart';

class GenreListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GenreListController(
        GenreListRepository(
          apiService: Get.find<ApiService>(),
        ),
      ),
    );
  }
}
