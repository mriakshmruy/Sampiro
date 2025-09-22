import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SampiroVideoControlsOverlay extends StatelessWidget {
  const SampiroVideoControlsOverlay({required this.controller, super.key});

  final VideoPlayerController controller;

  String _getVideoDuration() {
    final videoDuration = Duration(milliseconds: controller.value.duration.inMilliseconds);

    return [
      videoDuration.inMinutes,
      videoDuration.inSeconds,
    ].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');
  }

  String _getCurrentPosition() {
    final duration = Duration(milliseconds: controller.value.position.inMilliseconds);

    return [
      duration.inMinutes,
      duration.inSeconds,
    ].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.value.isPlaying ? controller.pause() : controller.play(),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          if (!controller.value.isPlaying) Icon(Icons.play_circle, color: theme.colorScheme.surface, size: 80),
          if (!controller.value.isPlaying)
            Positioned(
              left: 8,
              bottom: 12,
              child: Text('${_getCurrentPosition()} / ${_getVideoDuration()}', style: theme.textTheme.titleLarge),
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 14,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  // playedColor: theme.colorScheme.primary,
                  playedColor: Colors.orange,
                  bufferedColor: theme.colorScheme.primary.withValues(alpha: .4),
                  backgroundColor: theme.colorScheme.shadow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
