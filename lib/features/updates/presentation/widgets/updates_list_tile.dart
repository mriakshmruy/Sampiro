import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/updates/data/models/parish_update_model.dart';
import 'package:sampiro/features/updates/presentation/widgets/sampiro_cached_widget.dart';

class UpdatesListTile extends StatelessWidget {
  const UpdatesListTile({required this.parishUpdateModel, super.key});

  final ParishUpdateModel parishUpdateModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (parishUpdateModel.imageList.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(height: 400, viewportFraction: 1),
              items: parishUpdateModel.imageList.map((e) => SampiroCachedWidget(imageUrl: e)).toList(),
            ),

          Text(
            parishUpdateModel.title,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Text(parishUpdateModel.content),

          const SizedBox(height: 10),

          Text(parishUpdateModel.formattedPostingDate),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
