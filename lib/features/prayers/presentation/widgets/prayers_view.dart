import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/widgets/sampiro_list_tile.dart';
import 'package:sampiro/features/prayers/data/models/prayers_model.dart';
import 'package:sampiro/l10n/l10n.dart';

class PrayersView extends StatefulWidget {
  const PrayersView({super.key});

  @override
  State<PrayersView> createState() => _PrayersViewState();
}

class _PrayersViewState extends State<PrayersView> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;
  bool isAppBarImageShown = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    _scrollOffset = _scrollController.offset;
    if (_scrollOffset > 300) {
      setState(() => isAppBarImageShown = false);
    } else {
      setState(() => isAppBarImageShown = true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Assets.images.headerPrayers.image(fit: BoxFit.cover),
              title: isAppBarImageShown
                  ? null
                  : Text(
                      l10n.prayers,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
            ),
          ),

          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return SampiroListTile(
                image: Image.asset(PrayerTileModel.prayerList[index].imagePath, fit: BoxFit.cover),
                onTap: () {
                  context.router.push(
                    PrayersInformationRoute(
                      prayer: PrayerTileModel.prayerList[index],
                    ),
                  );
                },

                title: PrayerTileModel.prayerList[index].title,
              );
            },
            itemCount: PrayerTileModel.prayerList.length,
          ),
        ],
      ),
    );
  }
}
