import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labhouse_radio/src/core/utils/debouncer_timer.dart';
import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_pagination.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_provider.dart';
import 'package:marquee/marquee.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int pagination = 0;
  final debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  @override
  void dispose() {
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listRadios = ref.watch(radioPaginationNotifierProvider);
    final audioHandler = ref.watch(audioHandlerProvider);
    final listFavorites = ref.watch(getFavoritesRadiosListProvider);
    final mediaItem = ref.watch(streamMediaItemProvider);
    final playbackState = ref.watch(streamPlaybackStateProvider);
    final favorite = ref
        .watch(getFavoriteRadiosProvider(mediaItem.value?.id ?? ''))
        .valueOrNull;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Image.network(
          'https://static.wixstatic.com/media/80a726_869df0ad73b64122bc296d07a7280ef9~mv2.png/v1/crop/x_800,y_934,w_2381,h_620/fill/w_424,h_110,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/LABHOUSE_Logo2_02.png',
          width: 150,
          height: 150,
          errorBuilder: (context, error, stackTrace) => const SizedBox(),
        ),
      ),
      bottomSheet: Visibility(
        visible: mediaItem.value != null,
        child: SafeArea(
          child: ColoredBox(
            color: Theme.of(context).colorScheme.secondary,
            child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                height: constraints.maxHeight * 0.1,
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Image.network(
                          mediaItem.value?.artUri != null
                              ? mediaItem.value?.artUri.toString() as String
                              : 'https://via.placeholder.com/150',
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox(),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.5,
                              height: 25,
                              child: Marquee(
                                blankSpace: 10,
                                text: mediaItem.value?.title ??
                                    'Sin radio seleccionada',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ),
                            Text(
                              mediaItem.value?.extras?['language'] as String? ??
                                  '',
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            if (favorite == null) {
                              await ref
                                  .read(radioRepositoryProvider)
                                  .addFavoriteRadio(
                                    FavoriteRadio()
                                      ..name = mediaItem.value?.title
                                      ..internalId = mediaItem.value?.id
                                      ..favicon =
                                          mediaItem.value?.artUri?.toString()
                                      ..url = mediaItem.value?.extras?['url']
                                              as String? ??
                                          'No url'
                                      ..country =
                                          mediaItem.value?.extras?['language']
                                                  as String? ??
                                              'English',
                                  );
                            } else {
                              await ref
                                  .read(radioRepositoryProvider)
                                  .removeFavoriteRadio(
                                    favorite.id ?? 0,
                                  );
                            }
                          },
                          icon: Icon(
                            (favorite != null)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: (favorite != null)
                                ? Colors.red
                                : Theme.of(context).colorScheme.onSecondary,
                            size: 36,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (playbackState.value?.playing ?? false) {
                              audioHandler.pause();
                            } else {
                              audioHandler.play();
                            }
                          },
                          icon: Icon(
                            (playbackState.value?.playing ?? false)
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          switch (listFavorites) {
            AsyncData(:final value) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Favorites',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    if (value.isEmpty)
                      const SizedBox()
                    else
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async => audioHandler.setSong(
                                MediaItem(
                                  extras: <String, dynamic>{
                                    'url': value[index].url ?? 'No url',
                                    'language':
                                        value[index].country ?? 'No country',
                                  },
                                  artUri:
                                      value[index].favicon?.isNotEmpty ?? false
                                          ? Uri.parse(
                                              value[index].favicon as String,
                                            )
                                          : null,
                                  id: value[index].internalId ?? 'No name',
                                  title: value[index].name ?? 'No name',
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: Image.network(
                                        value[index].favicon?.isNotEmpty ??
                                                false
                                            ? value[index].favicon as String
                                            : 'https://via.placeholder.com/150',
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const SizedBox(),
                                      ).image,
                                    ),
                                    Text(
                                      value[index].name ?? 'No name',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            AsyncError(:final error) => Text('error: $error'),
            _ => const Text('loading'),
          },
          Padding(
            padding: const EdgeInsets.all(8),
            child: CupertinoSearchTextField(
              onChanged: (value) => debouncer.run(() async {
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
                              leading: CircleAvatar(
                                backgroundImage: Image.network(
                                  radio.favicon?.isNotEmpty ?? false
                                      ? radio.favicon as String
                                      : 'https://via.placeholder.com/150',
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox(),
                                ).image,
                              ),
                              title: Text(
                                radio.name ?? 'No name',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Image.network(
                                    'https://flagsapi.com/${radio.countrycode?.toUpperCase()}/flat/32.png',
                                    errorBuilder:
                                        (context, error, stackTrace) =>
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
