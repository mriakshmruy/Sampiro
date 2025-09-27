import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/widgets/image_card.dart';
import 'package:sampiro/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Assets.images.header.image(fit: BoxFit.cover),
              title: ColoredBox(
                color: theme.colorScheme.primary,
                child: Text(
                  l10n.stsPeterAndPaulParish,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.surface,
                    fontWeight: SampiroFontWeight.semiBold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCard(
              imagePath: Assets.images.headerMamaMary.path,
              title: l10n.testimonials,
              onTap: () {
                context.router.push(const TestimonialRoute());
              },

              padding: const EdgeInsets.only(top: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCard(
              imagePath: Assets.images.mamaMaryAddTestimonial.path,
              title: l10n.dailyReflection,
              onTap: () {},
              padding: const EdgeInsets.only(top: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCard(
              imagePath: Assets.images.videoHeader.path,
              title: l10n.videos,
              onTap: () {},
              padding: const EdgeInsets.only(top: 20, bottom: 20),
            ),
          ),
        ],
      ),
    );
  }
}
