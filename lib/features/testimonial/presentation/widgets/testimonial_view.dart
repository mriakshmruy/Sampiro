import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/l10n/l10n.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          context.router.push(const AddTestimonialRoute());
        },
        child: Text(l10n.compose),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.testimonialsMamaMary.image(fit: BoxFit.cover),
              title: Text(
                l10n.testimonials,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.surface,
                  backgroundColor: theme.colorScheme.primary,
                ),
              ),

              centerTitle: true,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Positioned(
          //     bottom: 10,
          //     right: 20,
          //     child: SampiroTestimonialButton(
          //       label: l10n.compose,
          //       onPressed: () {
          //         context.router.push(const AddTestimonialRoute());
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
