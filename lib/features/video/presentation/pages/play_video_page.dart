import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/widgets/sampiro_app_bar.dart';
import 'package:sampiro/core/widgets/sampiro_back_button.dart';
import 'package:sampiro/core/widgets/sampiro_video_player.dart';
import 'package:sampiro/features/video/data/models/parish_video_model.dart';
import 'package:sampiro/l10n/l10n.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class PlayVideoPage extends StatefulWidget {
  const PlayVideoPage({required this.parishVideo, super.key});

  final ParishVideo parishVideo;

  @override
  State<PlayVideoPage> createState() => _PlayVideoPageState();
}

class _PlayVideoPageState extends State<PlayVideoPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    if (!kReleaseMode) debugPrint('--x ${widget.parishVideo.videoLink}');

    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.parishVideo.videoLink))
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => _videoController.play());
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.tertiary,
      appBar: SampiroAppBar(leading: const SampiroBackButton(), title: l10n.video),
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              child: SampiroVideoPlayer(url: widget.parishVideo.videoLink, controller: _videoController),
            ),
          ),
          if (!_videoController.value.isPlaying)
            Positioned(
              left: 8,
              top: 20,
              right: 8,
              bottom: size.height * .6,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.parishVideo.title,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    Text(
                      widget.parishVideo.description,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: SampiroFontWeight.regular,
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
