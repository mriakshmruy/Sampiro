import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

class ScheduleABlessingView extends StatelessWidget {
  const ScheduleABlessingView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ServicesBloc>();
    final l10n = context.l10n;
    final theme = Theme.of(context);

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
                leading: IconButton(
                  onPressed: () {
                    context.router.push(const ServicesRoute());
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                centerTitle: true,
              ),

              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Text(
                      l10n.scheduleABlessingRequest,
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
                    buildWhen: (previous, current) => previous.property != current.property,
                    builder: (context, state) {
                      return SampiroDropDown(
                        isValid: state.isPropertyValid,
                        label: l10n.property,
                        dropDownMenuItem: [
                          DropdownMenuItem<String>(value: l10n.businessStore, child: Text(l10n.businessStore)),
                          DropdownMenuItem<String>(value: l10n.houseCondo, child: Text(l10n.houseCondo)),
                          DropdownMenuItem<String>(value: l10n.office, child: Text(l10n.office)),
                          DropdownMenuItem<String>(value: l10n.others, child: Text(l10n.others)),
                        ],

                        onChanged: (property) {
                          if (property == null) return;
                          bloc.add(ServicesPropertyChanged(property));
                        },
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.fieldName != current.fieldName,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.name1,
                        isValid: state.isNameValid,
                        onChanged: (fieldName) => bloc.add(ServicesFieldNameChanged(fieldName)),
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
                          DropdownMenuItem<String>(value: l10n.olympia, child: Text(l10n.olympia)),
                          DropdownMenuItem<String>(value: l10n.poblacion, child: Text(l10n.poblacion)),
                          DropdownMenuItem<String>(value: l10n.valenzuela, child: Text(l10n.valenzuela)),
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
                    buildWhen: (previous, current) => previous.mobileNo != current.mobileNo,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.mobileNo,
                        isValid: state.isMobileNoValid,
                        prefixText: '09',
                        inputFormatters: [mobileNoFormatter],
                        onChanged: (mobileNo) => bloc.add(ServicesMobileNoChanged(mobileNo)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.dateOfBlessing != current.dateOfBlessing,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.dateOfBlessing,
                        isValid: state.isDateOfBlessingValid,
                        inputFormatters: [monthDateYearFormatter],
                        onChanged: (dateOfBlessing) => bloc.add(ServicesDateOfBlessingChanged(dateOfBlessing)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) =>
                        previous.timeOfBlessing != current.timeOfBlessing ||
                        previous.formattedTimeOfBlessing != current.formattedTimeOfBlessing,
                    builder: (context, state) {
                      return SampiroTimePicker(
                        label: l10n.timeOfBlessing,
                        isValid: state.isTimeOfBlessingValid,
                        initialValue: state.formattedTimeOfBlessing,
                        onTimeSelected: (timeOfBlessing) => bloc.add(ServicesTimeOfBlessingChanged(timeOfBlessing)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.religion != current.religion,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.religion,
                        isValid: state.isReligionValid,
                        onChanged: (religion) => bloc.add(ServicesReligionChanged(religion)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.reason != current.reason,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.reason,
                        isValid: state.isReasonValid,
                        onChanged: (reason) => bloc.add(ServicesReasonChanged(reason)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: state.isRequestScheduleValid
                              ? () {
                                  bloc.add(const ServicesSubmitted('schedule a blessing'));
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
