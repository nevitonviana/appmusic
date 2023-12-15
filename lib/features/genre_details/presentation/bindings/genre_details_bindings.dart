import 'package:get/get.dart';

import '../../../../core/services/api_service.dart';
import '../../../../shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../../data/repositories/genre_details_repository.dart';
import '../controllers/genre_details_controller.dart';

class GenreDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GenreDetailsController(
        genreDetailsRepository: GenreDetailsRepository(
          apiService: Get.find<ApiService>(),
        ),
        musicPlayerController: Get.find<MusicPlayerController>(),
      ),
    );
  }
}
