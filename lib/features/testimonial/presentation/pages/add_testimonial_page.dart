import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/resources/assets.gen.dart';
import 'package:sampiro/core/widgets/sampiro_app_bar.dart';
import 'package:sampiro/core/widgets/sampiro_page_loader.dart';
import 'package:sampiro/core/widgets/sampiro_text_field.dart';
import 'package:sampiro/features/testimonial/presentation/bloc/testimonial_bloc.dart';
import 'package:sampiro/features/testimonial/presentation/pages/testimonial_dialog.dart';
import 'package:sampiro/l10n/l10n.dart';

@RoutePage()
class AddTestimonialPage extends StatelessWidget {
  const AddTestimonialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TestimonialBloc>();
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return BlocListener<TestimonialBloc, TestimonialState>(
      listener: (context, state) {
        if (state.statusForAddingTestimonial == TestimonialStatus.successful ||
            state.errorTestimonialAddingMessage != null) {
          showDialog<void>(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return TestimonialDialog(
                submitted: l10n.yourTestimonialHasBeenSubmitted,
                onPressed: () => context.router.popUntilRoot(),
              );
            },
          );
        }

        if (state.statusForAddingTestimonial == TestimonialStatus.failed &&
            state.errorTestimonialAddingMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorTestimonialAddingMessage.toString())),
          );
        }
      },

      child: BlocSelector<TestimonialBloc, TestimonialState, TestimonialStatus>(
        selector: (state) {
          return state.statusForAddingTestimonial;
        },
        builder: (context, status) {
          return SampiroPageLoader(
            isLoading: status == TestimonialStatus.loading,

            child: Scaffold(
              backgroundColor: theme.colorScheme.primary,
              appBar: SampiroAppBar(
                appBarColor: theme.colorScheme.primary,
                title: l10n.addATestimonial,
                leading: IconButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: theme.colorScheme.surface,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 500),
                          child: ColoredBox(
                            color: theme.colorScheme.primary,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: UIConstants.radiusCircular,
                                  topRight: UIConstants.radiusCircular,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.mamaMaryAddTestimonial.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: BlocBuilder<TestimonialBloc, TestimonialState>(
                            buildWhen: (previous, current) =>
                                previous.isSendTestimonialValid != current.isSendTestimonialValid,
                            builder: (context, state) {
                              return SampiroTextField(
                                isValid: state.isSendTestimonialValid,
                                label: l10n.yourTestimonial,
                                hintText: l10n.typeYourTestimonial,
                                minLines: 2,
                                maxLines: 6,
                                onChanged: (testimonial) => bloc.add(TestimonialTyped(testimonial)),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: BlocBuilder<TestimonialBloc, TestimonialState>(
                            buildWhen: (previous, current) => previous.isNameValid != current.isNameValid,
                            builder: (context, state) {
                              return SampiroTextField(
                                isValid: state.isNameValid,
                                label: l10n.yourName,
                                hintText: l10n.typeYourName,
                                onChanged: (name) => bloc.add(TestimonialNameTyped(name)),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: BlocBuilder<TestimonialBloc, TestimonialState>(
                            buildWhen: (previous, current) =>
                                previous.isSendTestimonialValid != current.isSendTestimonialValid,
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: state.isTestimonialValid
                                    ? () {
                                        bloc.add(const TestimonialSubmitted());
                                      }
                                    : null,
                                child: Text(
                                  l10n.send,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
