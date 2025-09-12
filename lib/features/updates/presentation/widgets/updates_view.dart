import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/l10n/l10n.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.headerParishUpdates.image(fit: BoxFit.cover),
              centerTitle: true,
              title: ColoredBox(
                color: theme.colorScheme.primary,
                child: Text(
                  l10n.parishUpdates,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.surface,
                    fontWeight: SampiroFontWeight.semiBold,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(height: 400),
              items: [
                CachedNetworkImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/sampiro-flutter-app-dev.firebasestorage.app/o/images%2F1730878712057_217724598.jpg?alt=media&token=e596c088-8f64-4eca-9cae-ac7e523df160',
                  imageBuilder: (context, imageProvider) => Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer(
                    child: Container(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                CachedNetworkImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/sampiro-flutter-app-dev.firebasestorage.app/o/images%2F1730876965474_790854975.jpg?alt=media&token=ac711a60-1c0e-45ae-a27e-3ce31995bb6b',
                  imageBuilder: (context, imageProvider) => Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer(
                    child: Container(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
