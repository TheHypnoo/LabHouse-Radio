import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:labhouse_radio/src/app.dart';
import 'package:labhouse_radio/src/core/utils/audio_handler.dart';
import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_provider.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  FlutterError.onError = (FlutterErrorDetails details) async {
    log(details.exceptionAsString());
    FlutterError.presentError(details);
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    log(
      error.toString(),
      name: 'LabHouse Radio',
      error: error,
      stackTrace: stack,
    );
    return true;
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    debugPrint('DETAILS: ${details.exceptionAsString()} "${details.stack}"');
    return Scaffold(
      body: Center(
        child: Text(
          kDebugMode
              ? details.exception.toString()
              : 'An error occurred, please restart the app.',
        ),
      ),
    );
  };
  await initAudioService();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [FavoriteRadioSchema],
    directory: dir.path,
  );
  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      observers: const [], //const [StateLogger()],
      child: const App(),
    ),
  );
}
