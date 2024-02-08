import 'package:labhouse_radio/src/core/utils/debouncer_timer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debouncer_notifier.g.dart';

@Riverpod(keepAlive: true)
class DebouncerNotifier extends _$DebouncerNotifier {
  @override
  Debouncer build(Duration duration) => Debouncer(delay: duration);
}
