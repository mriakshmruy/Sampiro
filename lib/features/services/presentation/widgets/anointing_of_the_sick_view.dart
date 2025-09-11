import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/utils/input_formatter.dart';
import 'package:sampiro/core/widgets/sampiro_drop_down.dart';
import 'package:sampiro/core/widgets/sampiro_page_loader.dart';
import 'package:sampiro/core/widgets/sampiro_text_field.dart';
import 'package:sampiro/core/widgets/sampiro_time_picker.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/features/services/presentation/widgets/request_dialog.dart';
import 'package:sampiro/l10n/l10n.dart';

class AnointingOfTheSickView extends StatelessWidget {
  const AnointingOfTheSickView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ServicesBloc>();
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return BlocListener<ServicesBloc, ServicesState>(
      listener: (context, state) {
        if (state.status == ServicesStatus.successful && state.docRefId.isNotEmpty) {
          showDialog<void>(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return RequestDialog(
                docRefId: state.docRefId,
                onPressed: () {
                  context.router.popUntilRoot();
                },
              );
            },
          );
        }
        if (state.status == ServicesStatus.failed && state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },

      child: BlocSelector<ServicesBloc, ServicesState, ServicesStatus>(
        selector: (state) {
          return state.status;
        },
        builder: (context, status) {
          return SampiroPageLoader(
            isLoading: status == ServicesStatus.loading,

            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  l10n.parishServices,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.surface),
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    context.router.push(const ServicesRoute());
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Text(
                      l10n.anointingOfTheSick,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(),
                  Text(l10n.topC),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.nameOfSickThePerson != current.nameOfSickThePerson,
                    builder: (context, state) {
                      return SampiroTextField(
                        isValid: state.isNameOfSickPersonValid,
                        label: l10n.nameOfTheSickPerson,
                        onChanged: (nameOfTheSickPerson) =>
                            bloc.add(ServicesNameOfTheSickPersonChanged(nameOfTheSickPerson)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.barangay != current.barangay,
                    builder: (context, state) {
                      return SampiroDropDown(
                        label: l10n.barangay,
                        isValid: state.isBarangayValid,
                        dropDownMenuItem: [
                          DropdownMenuItem<String>(
                            value: l10n.olympia,
                            child: Text(l10n.olympia),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.poblacion,
                            child: Text(l10n.poblacion),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.valenzuela,
                            child: Text(l10n.valenzuela),
                          ),
                        ],
                        onChanged: (barangay) {
                          if (barangay == null) return;
                          bloc.add(ServicesBarangayChanged(barangay));
                        },
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.address != current.address,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.address,
                        isValid: state.isAddressValid,
                        onChanged: (address) => bloc.add(ServicesAddressChanged(address)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.age != current.age,
                    builder: (context, state) {
                      return SampiroTextField(
                        keyboardType: TextInputType.number,
                        label: l10n.age,
                        isValid: state.isAgeValid,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(2)],
                        onChanged: (age) => bloc.add(ServicesAgeChanged(age)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.sickness != current.sickness,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.sickness,
                        isValid: state.isSicknessValid,
                        onChanged: (sickness) => bloc.add(ServicesSicknessChanged(sickness)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.nameOfRequestingPerson != current.nameOfRequestingPerson,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.nameOfRequestingPerson,
                        isValid: state.isNameOfRequestingPersonValid,
                        onChanged: (value) => bloc.add(ServicesNameOfRequestingPersonChanged(value)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.relationshipWithSick != current.relationshipWithSick,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.relationshipWithTheSick,
                        isValid: state.isRelationshipWithSickValid,
                        onChanged: (relationshipWithTheSick) =>
                            bloc.add(ServicesRelationshipWithSickChanged(relationshipWithTheSick)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) =>
                        previous.contactNumberOfRequestingPerson != current.contactNumberOfRequestingPerson,
                    builder: (context, state) {
                      return SampiroTextField(
                        prefixText: '09',
                        label: l10n.contactNumberOfRequestingPerson,
                        isValid: state.isContactNumberOfRequestingPersonValid,
                        inputFormatters: [mobileNoFormatter],
                        onChanged: (contactNumberOfRequestingPerson) =>
                            bloc.add(ServicesContactNumberOfRequestingPersonChanged(contactNumberOfRequestingPerson)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.dateOfAnointing != current.dateOfAnointing,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.dateOfAnointing,
                        isValid: state.isDateOfAnointingValid,
                        inputFormatters: [monthDateYearFormatter],
                        onChanged: (dateOfAnointing) => bloc.add(ServicesDateOfAnointingChanged(dateOfAnointing)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) =>
                        previous.isTimeOfAnointing != current.isTimeOfAnointing ||
                        previous.formattedTimeAnointing != current.formattedTimeAnointing,
                    builder: (context, state) {
                      return SampiroTimePicker(
                        label: l10n.timeOfAnointing,
                        isValid: state.isTimeOfAnointing,
                        initialValue: state.formattedTimeAnointing,
                        onTimeSelected: (timeOfAnointing) => bloc.add(ServicesTimeOfAnointingChanged(timeOfAnointing)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.isRequestFormValid != current.isRequestFormValid,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: state.isRequestFormValid
                              ? () {
                                  bloc.add(const ServicesSubmitted('anointing of the sick'));
                                }
                              : null,
                          child: Text(l10n.submit),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
