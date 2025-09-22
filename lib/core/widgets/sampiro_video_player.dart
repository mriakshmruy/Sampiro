import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sampiro/core/widgets/sampiro_video_controls_overlay.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class SampiroVideoPlayer extends StatefulWidget {
  const SampiroVideoPlayer({required this.url, required this.controller, super.key});
  final String url;
  final VideoPlayerController controller;

  @override
  State<SampiroVideoPlayer> createState() => _SampiroVideoPlayerState();
}

class _SampiroVideoPlayerState extends State<SampiroVideoPlayer> {
  @override
  void initState() {
    super.initState();
    _preventDeviceToSleep();
  }

  // Prevents the device to sleep.
  Future<void> _preventDeviceToSleep() async {
    await WakelockPlus.enable();
  }

  // Disables the wake lock
  Future<void> _disableWakeLock() async {
    await WakelockPlus.disable();
  }

  @override
  void dispose() {
    _disableWakeLock();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return widget.controller.value.isInitialized
        ? Stack(
            children: [
              AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: VideoPlayer(widget.controller),
              ),
              Positioned.fill(child: SampiroVideoControlsOverlay(controller: widget.controller)),
            ],
          )
        : SpinKitFadingCircle(color: theme.colorScheme.surface);
  }
}
