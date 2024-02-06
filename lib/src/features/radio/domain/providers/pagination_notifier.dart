import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pagination_notifier.g.dart';

@riverpod
class PaginationNotifier extends _$PaginationNotifier {
  @override
  int build() => 0;

  void addPagination() {
    state = state + 1;
  }

  void resetPagination() {
    state = 0;
  }
}
