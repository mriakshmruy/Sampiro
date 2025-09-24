import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/widgets/image_card.dart';
import 'package:sampiro/l10n/l10n.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: ListView(
        children: [
          ImageCard(
            imagePath: Assets.images.mamaMaryAddTestimonial.path,
            title: l10n.dailyReflection,
            padding: const EdgeInsets.only(top: 20),
            height: 500,
            onTap: () => context.router.push(const ReflectionRoute()),
          ),
          ImageCard(
            imagePath: Assets.images.schedule.path,
            title: l10n.parishSchedule,
            padding: const EdgeInsets.only(top: 20),
          ),
          ImageCard(
            imagePath: Assets.images.header.path,
            title: l10n.sampiro,
            padding: const EdgeInsets.only(top: 20),
          ),
          ImageCard(
            imagePath: Assets.images.contactUs.path,
            title: l10n.parishOffice,
            padding: const EdgeInsets.only(top: 20),
          ),
          ImageCard(
            imagePath: Assets.images.videoHeader.path,
            title: l10n.videos,
            padding: const EdgeInsets.only(top: 20),
            onTap: () => context.router.push(const VideoRoute()),
          ),

          BlocBuilder<AppBloc, AppState>(
            buildWhen: (previous, current) =>
                previous.version != current.version || previous.buildNumber != current.buildNumber,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Text(
                  'v${state.version} (${state.buildNumber})',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.surface),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
