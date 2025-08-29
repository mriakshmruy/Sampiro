import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/widgets/sampiro_list_tile.dart';
import 'package:sampiro/features/services/data/models/services_model.dart';
import 'package:sampiro/l10n/l10n.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
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
    final theme = Theme.of(context);
    final l10n = context.l10n;

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
              background: Assets.images.communion.image(fit: BoxFit.cover),
              title: isAppBarImageShown ? null : Text(l10n.parishServices),
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
                image: Image.asset(ServicesTileModel.serviceList[index].imagePath),
                title: ServicesTileModel.serviceList[index].title,
              );
            },
            itemCount: ServicesTileModel.serviceList.length,
          ),
        ],
      ),
    );
  }
}
