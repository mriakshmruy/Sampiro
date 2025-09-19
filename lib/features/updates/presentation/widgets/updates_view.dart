import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/features/updates/presentation/bloc/updates_bloc.dart';
import 'package:sampiro/features/updates/presentation/widgets/updates_list_tile.dart';
import 'package:sampiro/l10n/l10n.dart';

class UpdatesView extends StatefulWidget {
  const UpdatesView({super.key});

  @override
  State<UpdatesView> createState() => _UpdatesViewState();
}

class _UpdatesViewState extends State<UpdatesView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<UpdatesBloc>().add(const UpdatesParishUpdateFetched());

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        context.read<UpdatesBloc>().add(const UpdatesParishMoreUpdateFetched());
      }
    });
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
      body: CustomScrollView(
        controller: _scrollController,
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
          BlocSelector<UpdatesBloc, UpdatesState, UpdatesStatus>(
            selector: (state) {
              return state.status;
            },
            builder: (context, status) {
              if (status == UpdatesStatus.loading) {
                return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
              }

              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
          BlocBuilder<UpdatesBloc, UpdatesState>(
            buildWhen: (previous, current) =>
                previous.status != current.status || previous.errorMessage != current.errorMessage,
            builder: (context, state) {
              if (state.status == UpdatesStatus.failed && state.errorMessage != null) {
                return SliverToBoxAdapter(child: Center(child: Text('${state.errorMessage}')));
              }
              return SliverToBoxAdapter(child: Container());
            },
          ),
          BlocBuilder<UpdatesBloc, UpdatesState>(
            builder: (context, state) {
              return SliverList.builder(
                itemCount: state.updateList.length + (state.hasNextPage ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.updateList.length) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return UpdatesListTile(parishUpdateModel: state.updateList[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
