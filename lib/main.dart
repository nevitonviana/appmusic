import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/app/music_app.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MusicApp());
}
