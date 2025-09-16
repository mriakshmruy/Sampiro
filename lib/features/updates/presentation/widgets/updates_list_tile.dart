import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/updates/data/models/parish_update_model.dart';
import 'package:sampiro/features/updates/presentation/widgets/sampiro_cached_widget.dart';

class UpdatesListTile extends StatelessWidget {
  const UpdatesListTile({required this.parishUpdateModel, super.key});

  final ParishUpdateModel parishUpdateModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (parishUpdateModel.imageList.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(height: 400),
              items: parishUpdateModel.imageList.map((e) => SampiroCachedWidget(imageUrl: e)).toList(),
            ),

          Text(parishUpdateModel.title),

          Text(parishUpdateModel.content),

          Text(parishUpdateModel.formattedPostingDate),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
