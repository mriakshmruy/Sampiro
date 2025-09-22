import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/features/video/presentation/bloc/video_bloc.dart';
import 'package:sampiro/features/video/presentation/widgets/video_list_tile.dart';
import 'package:sampiro/l10n/l10n.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<VideoBloc>().add(const VideosFetched());

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        context.read<VideoBloc>().add(const VideosLoadMore());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VideoBloc>();
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.videoHeader.image(fit: BoxFit.cover),
              centerTitle: true,
              title: ColoredBox(
                color: theme.colorScheme.primary,
                child: Text(
                  l10n.videos,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.surface,
                    fontWeight: SampiroFontWeight.semiBold,
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: theme.colorScheme.primary,
              ),
              onPressed: () {
                context.router.push(const MoreRoute());
              },
            ),
          ),

          BlocBuilder<VideoBloc, VideoState>(
            buildWhen: (previous, current) =>
                previous.statusForVideoFetching != current.statusForVideoFetching ||
                previous.errorForFetchingVideoMessage != current.errorForFetchingVideoMessage ||
                previous.videoList != current.videoList ||
                previous.hasNextPage != current.hasNextPage,
            builder: (context, state) {
              if (state.statusForVideoFetching == VideoStatus.loading) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              } else if (state.statusForVideoFetching == VideoStatus.failed &&
                  state.errorForFetchingVideoMessage != null) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () => bloc.add(const VideosFetched()),
                    ),
                  ),
                );
              } else if (state.statusForVideoFetching == VideoStatus.successful && state.videoList.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () => bloc.add(const VideosFetched()),
                    ),
                  ),
                );
              } else if (state.statusForVideoFetching == VideoStatus.successful && state.videoList.isNotEmpty) {
                return SliverList.builder(
                  itemCount: state.videoList.length + (state.hasNextPage ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == state.videoList.length) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: CircularProgressIndicator(color: theme.colorScheme.surface),
                      );
                    }
                    final isFirstItem = index == 0;

                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                        top: isFirstItem ? 10 : 0,
                      ),
                      child: VideoListTile(
                        parishVideo: state.videoList[index],
                        index: index,
                        onVideoPlayTap: () => context.pushRoute(PlayVideoRoute(parishVideo: state.videoList[index])),
                      ),
                    );
                  },
                );
              }

              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }
}
