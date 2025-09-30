import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/testimonial/presentation/widgets/testimonial_view.dart';

@RoutePage()
class TestimonialPage extends StatelessWidget {
  const TestimonialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TestimonialView();
  }
}
