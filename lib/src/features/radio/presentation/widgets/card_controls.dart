import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labhouse_radio/src/features/radio/data/models/favorite_model.dart';
import 'package:labhouse_radio/src/features/radio/domain/providers/radio_provider.dart';
import 'package:marquee/marquee.dart';

class CardControls extends ConsumerWidget {
  const CardControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaItem = ref.watch(streamMediaItemProvider);
    final playbackState = ref.watch(streamPlaybackStateProvider);
    final favorite = ref
        .watch(getFavoriteRadiosProvider(mediaItem.value?.id ?? ''))
        .valueOrNull;
    final audioHandler = ref.watch(audioHandlerProvider);
    return Visibility(
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
                      CachedNetworkImage(
                        imageUrl: mediaItem.value?.artUri != null
                            ? mediaItem.value?.artUri.toString() as String
                            : 'https://via.placeholder.com/150',
                        height: 50,
                        width: 50,
                        errorWidget: (context, error, stackTrace) =>
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
                              color: Theme.of(context).colorScheme.onSecondary,
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
                                    ..country = mediaItem.value
                                            ?.extras?['language'] as String? ??
                                        'English',
                                );
                          } else {
                            await ref
                                .read(radioRepositoryProvider)
                                .removeFavoriteRadio(
                                  favorite.id ?? 0,
                                );
                          }
                          ref.invalidate(
                            getFavoriteRadiosProvider(
                              mediaItem.value?.id ?? '',
                            ),
                          );
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
    );
  }
}
