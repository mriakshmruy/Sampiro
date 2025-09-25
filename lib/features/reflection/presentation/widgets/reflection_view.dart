import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sampiro/core/keys/sampiro_keys.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/features/dashboard/presentation/bloc/bloc.dart';
import 'package:sampiro/features/reflection/data/model/parish_reflection_model.dart';
import 'package:sampiro/features/reflection/presentation/bloc/reflection_bloc.dart';
import 'package:sampiro/l10n/l10n.dart';

class ReflectionView extends StatelessWidget {
  const ReflectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final today = DateFormat('EEEE, MMM. d, yyyy').format(DateTime.now());
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.dailyReflection,
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.surface),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            context.router.push(const MoreRoute());
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image(image: AssetImage(Assets.images.mamaMaryAddTestimonial.path), fit: BoxFit.cover),
          ),
          Positioned(
            top: size.height * .45,
            left: 50,
            right: 50,
            bottom: 50,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: BlocBuilder<ReflectionBloc, ReflectionState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status || previous.reflection != current.reflection,
                builder: (context, state) {
                  if (state.status == ReflectionStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == ReflectionStatus.successful &&
                      state.reflection != ParishReflectionModel.empty) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              today,
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              key: SampiroKeys.dailyReflectionKey,
                              state.reflection.reflection,
                              textAlign: TextAlign.right,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state.status == ReflectionStatus.failed && state.errorMessage != null) {
                    Text(key: SampiroKeys.dailyReflectionErrorKey, '${state.errorMessage}');
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
