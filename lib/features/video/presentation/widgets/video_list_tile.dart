import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/widgets/sampiro_cached_network_image.dart';
import 'package:sampiro/features/video/data/models/parish_video_model.dart';
import 'package:sampiro/features/video/presentation/bloc/video_bloc.dart';

class VideoListTile extends StatelessWidget {
  const VideoListTile({required this.parishVideo, required this.index, super.key, this.onVideoPlayTap});

  final ParishVideo parishVideo;
  final int index;
  final VoidCallback? onVideoPlayTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const thumbnailSize = 300.0;

    return Container(
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: onVideoPlayTap,
            child: SizedBox(
              height: thumbnailSize,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (parishVideo.videoThumbnailLink.isNotEmpty)
                    SampiroCachedNetworkImage(
                      borderColor: theme.colorScheme.primary,
                      borderRadius: BorderRadius.zero,
                      url: parishVideo.videoThumbnailLink,
                    )
                  else
                    ColoredBox(color: theme.colorScheme.tertiary),

                  BlocBuilder<VideoBloc, VideoState>(
                    builder: (context, state) {
                      return ColoredBox(
                        color: theme.colorScheme.tertiary.withValues(alpha: .5),
                        child: Icon(
                          size: 80,
                          Icons.play_circle,
                          color: theme.colorScheme.surface,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(parishVideo.title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              parishVideo.description,
              style: theme.textTheme.bodyMedium,
            ),
          ),

          Text(parishVideo.elapsedTime),
        ],
      ),
    );
  }
}
