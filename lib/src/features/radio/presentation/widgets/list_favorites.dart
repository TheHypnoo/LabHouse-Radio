import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_provider.dart';

class ListFavorites extends ConsumerWidget {
  const ListFavorites({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioHandler = ref.watch(audioHandlerProvider);
    final listFavorites = ref.watch(getFavoritesRadiosListProvider);
    return switch (listFavorites) {
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
                              'language': value[index].country ?? 'No country',
                            },
                            artUri: value[index].favicon?.isNotEmpty ?? false
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
                                backgroundImage: CachedNetworkImageProvider(
                                  value[index].favicon?.isNotEmpty ?? false
                                      ? value[index].favicon as String
                                      : 'https://via.placeholder.com/150',
                                  errorListener: (p0) => const SizedBox(),
                                ),
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
    };
  }
}
