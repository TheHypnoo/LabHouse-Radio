import 'package:labhouse_radio/src/features/radio/data/models/radio_model.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/pagination_notifier.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radio_pagination.g.dart';

@riverpod
class RadioPaginationNotifier extends _$RadioPaginationNotifier {
  @override
  Future<List<RadioModel>> build() async {
    final pagination = ref.read(paginationNotifierProvider);
    return ref.read(radioRepositoryProvider).getRadioList(pagination);
  }

  Future<void> addPagination() async {
    final pagination = ref.read(paginationNotifierProvider);
    final newPagination =
        await ref.read(radioRepositoryProvider).getRadioList(pagination);
    state = AsyncData([...?state.value, ...newPagination]);
  }

  Future<void> resetList() async {
    state = const AsyncLoading();
    ref.read(paginationNotifierProvider.notifier).resetPagination();

    final pagination = ref.read(paginationNotifierProvider);
    final newList =
        await ref.read(radioRepositoryProvider).getRadioList(pagination);
    state = AsyncData([...newList]);
  }

  Future<void> searchRadios(String query) async {
    state = const AsyncLoading();
    final newListSearched =
        await ref.read(radioRepositoryProvider).searchRadios(query);
    if (newListSearched.isEmpty) {
      state = AsyncError(
        'We have not found any radio with this name',
        StackTrace.current,
      );
      return;
    }
    state = AsyncData([...newListSearched]);
  }
}
