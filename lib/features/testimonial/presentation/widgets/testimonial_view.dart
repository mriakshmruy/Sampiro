import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/features/testimonial/presentation/bloc/testimonial_bloc.dart';
import 'package:sampiro/features/testimonial/presentation/widgets/testimonial_definition.dart';
import 'package:sampiro/features/testimonial/presentation/widgets/testimonial_tile.dart';
import 'package:sampiro/l10n/l10n.dart';

class TestimonialView extends StatefulWidget {
  const TestimonialView({super.key});

  @override
  State<TestimonialView> createState() => _TestimonialViewState();
}

class _TestimonialViewState extends State<TestimonialView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<TestimonialBloc>().add(const TestimonialFetched());

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        context.read<TestimonialBloc>().add(const TestimonialLoadMore());
      }
    });

    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: theme.colorScheme.primary,
        onPressed: () {
          context.router.push(const AddTestimonialRoute());
        },
        child: Text(
          l10n.compose,
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.surface),
        ),
      ),

      body: CustomScrollView(
        controller: _scrollController,
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: IconButton(
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (context) => const TestimonialDefinition(),
                  ),
                  icon: const Icon(CupertinoIcons.info_circle),
                ),
              ),
            ],
          ),

          BlocBuilder<TestimonialBloc, TestimonialState>(
            buildWhen: (previous, current) =>
                previous.statusForFetchingTestimonial != current.statusForFetchingTestimonial ||
                previous.errorTestimonialFetchingMessage != current.errorTestimonialFetchingMessage ||
                previous.testimonialList != current.testimonialList ||
                previous.hasNextPage != current.hasNextPage,

            builder: (context, state) {
              if (state.statusForFetchingTestimonial == TestimonialStatus.loading) {
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              } else if (state.statusForFetchingTestimonial == TestimonialStatus.failed &&
                  state.errorTestimonialFetchingMessage != null) {
                return SliverToBoxAdapter(child: Center(child: Text('${state.errorTestimonialFetchingMessage}')));
              } else if (state.statusForFetchingTestimonial == TestimonialStatus.successful &&
                  state.testimonialList.isNotEmpty) {
                return SliverList.builder(
                  itemCount: state.testimonialList.length,
                  itemBuilder: (context, index) {
                    if (index == state.testimonialList.length + (state.hasNextPage ? 1 : 0)) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: CircularProgressIndicator(color: theme.colorScheme.surface),
                      );
                    }
                    final isFirstItem = index == 0;
                    final isLastItem = index == (state.testimonialList.length - 1);
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: (isLastItem && (!state.hasNextPage)) ? 150 : 10,
                        top: isFirstItem ? 30 : 0,
                      ),
                      child: TestimonialTile(testimonial: state.testimonialList[index]),
                    );
                  },
                );
              } else {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }
            },
          ),
        ],
      ),
    );
  }
}
