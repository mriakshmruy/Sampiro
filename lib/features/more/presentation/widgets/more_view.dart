import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/app_bloc.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/widgets/image_card.dart';
import 'package:sampiro/core/widgets/sampiro_list_tile.dart';
import 'package:sampiro/l10n/l10n.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ImageCard(
              image: Assets.images.reflection.image(),
              title: l10n.dailyReflection,
              padding: const EdgeInsets.only(top: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCard(
              image: Assets.images.schedule.image(),
              title: l10n.parishSchedule,
              padding: const EdgeInsets.only(top: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCard(
              image: Assets.images.header.image(),
              title: l10n.sampiro,
              padding: const EdgeInsets.only(top: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCard(
              image: Assets.images.contactUs.image(),
              title: l10n.parishOffice,
              padding: const EdgeInsets.only(top: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCard(
              image: Assets.images.videoHeader.image(),
              title: l10n.videos,
              padding: const EdgeInsets.only(top: 20),
            ),
          ),
        ],
      ),
      // body: BlocBuilder<AppBloc, AppState>(
      //   buildWhen: (previous, current) =>
      //       previous.version != current.version || previous.buildNumber != current.buildNumber,
      //   builder: (context, state) {
      //     return Text(
      //       'v${state.version} (${state.buildNumber})',
      //       style: theme.textTheme.bodyMedium,
      //     );
      //   },
      // ),
    );
  }
}
