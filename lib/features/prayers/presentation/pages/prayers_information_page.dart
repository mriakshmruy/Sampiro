import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/prayers/data/models/prayers_model.dart';

@RoutePage()
class PrayersInformationPage extends StatelessWidget {
  const PrayersInformationPage({required this.prayer, super.key});
  final PrayerTileModel prayer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                prayer.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                ),
                Text(prayer.title),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
