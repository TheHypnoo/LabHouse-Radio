import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labhouse_radio/src/core/constants/constants.dart';
import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/debouncer_notifier.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_pagination.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_provider.dart';
import 'package:labhouse_radio/src/features/radio/presentation/widgets/card_controls.dart';
import 'package:labhouse_radio/src/features/radio/presentation/widgets/list_favorites.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final listRadios = ref.watch(radioPaginationNotifierProvider);
    final audioHandler = ref.watch(audioHandlerProvider);
    final mediaItem = ref.watch(streamMediaItemProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: CachedNetworkImage(
          imageUrl: imageLabHouse,
          width: 150,
          height: 150,
          errorWidget: (context, error, stackTrace) => const SizedBox(),
        ),
      ),
      bottomSheet: const CardControls(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ListFavorites(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: CupertinoSearchTextField(
              onChanged: (value) => ref
                  .read(debouncerNotifierProvider.call(Durations.long2))
                  .run(() async {
                if (value.isEmpty) {
                  await ref
                      .read(radioPaginationNotifierProvider.notifier)
                      .resetList();
                } else {
                  await ref
                      .read(radioPaginationNotifierProvider.notifier)
                      .searchRadios(value);
                }
              }),
            ),
          ),
          Expanded(
            child: listRadios.when(
              data: (radios) {
                return LayoutBuilder(
                  builder: (context, constraints) => Padding(
                    padding: EdgeInsets.only(
                      bottom: mediaItem.value != null
                          ? constraints.maxHeight * 0.1
                          : 0,
                    ),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification) {
                          final metrics = notification.metrics;
                          if (metrics.extentAfter == 0) {
                            ref
                                .read(radioPaginationNotifierProvider.notifier)
                                .addPagination();
                          }
                        }
                        return false;
                      },
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: radios.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            final radio = radios[index];
                            final favoriteRadio = ref
                                .watch(
                                  getFavoriteRadiosProvider(radio.id ?? ''),
                                )
                                .value;
                            return ListTile(
                              leading: AspectRatio(
                                aspectRatio: 0.8,
                                child: CachedNetworkImage(
                                  imageUrl: radio.favicon?.isNotEmpty ?? false
                                      ? radio.favicon as String
                                      : 'https://via.placeholder.com/150',
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                  ),
                                  errorWidget: (context, error, stackTrace) =>
                                      const SizedBox(),
                                ),
                              ),
                              title: Text(
                                radio.name ?? 'No name',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: (radio.countrycode?.isNotEmpty ??
                                            false)
                                        ? 'https://flagsapi.com/${radio.countrycode?.toUpperCase()}/flat/32.png'
                                        : 'https://via.placeholder.com/32',
                                    errorWidget: (context, error, stackTrace) =>
                                        const SizedBox(),
                                  ),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      radio.country ?? 'No country',
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: favoriteRadio != null
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                      ),
                                onPressed: () async {
                                  if (favoriteRadio != null) {
                                    await ref
                                        .read(radioRepositoryProvider)
                                        .removeFavoriteRadio(
                                          favoriteRadio.id ?? 0,
                                        );
                                  } else {
                                    await ref
                                        .read(radioRepositoryProvider)
                                        .addFavoriteRadio(
                                          FavoriteRadio()
                                            ..name = radio.name
                                            ..internalId = radio.id
                                            ..favicon = radio.favicon
                                            ..url = radio.url
                                            ..country = radio.country,
                                        );
                                  }
                                  ref
                                    ..invalidate(
                                      getFavoriteRadiosProvider(
                                        radio.id ?? '',
                                      ),
                                    )
                                    ..invalidate(
                                      getFavoritesRadiosListProvider,
                                    );
                                },
                              ),
                              onTap: () async => audioHandler.setSong(
                                MediaItem(
                                  extras: <String, dynamic>{
                                    'url': radio.url ?? 'No url',
                                    'language': radio.country ?? 'No country',
                                  },
                                  artUri: radio.favicon?.isNotEmpty ?? false
                                      ? Uri.parse(radio.favicon as String)
                                      : null,
                                  id: radio.id ?? 'No name',
                                  title: radio.name ?? 'No name',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '$error',
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
