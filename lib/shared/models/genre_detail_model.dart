import 'genre_model.dart';
import 'music_model.dart';

class GenreDetailModel extends GenreModel {
  final List<MusicModel> musics;

  GenreDetailModel({
    required super.title,
    super.img,
    required this.musics,
    required super.searchString,
  });

  factory GenreDetailModel.fromMap(Map<String, dynamic> map) {
    return GenreDetailModel(
      title: map[''] ?? '',
      musics: (map['musics'] as List)
          .map((music) => MusicModel.fromMap(music))
          .toList(),
      searchString: map['searchString'] ?? '',
      img: map['img'] ?? '',
    );
  }
}
