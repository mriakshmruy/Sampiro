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

class CounselingView extends StatelessWidget {
  const CounselingView({super.key});

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
                      l10n.counselingRequest,
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
                    buildWhen: (previous, current) => previous.isNameValid != current.isNameValid,
                    builder: (context, state) {
                      return SampiroTextField(
                        isValid: state.isNameValid,
                        label: l10n.name1,
                        textCapitalization: TextCapitalization.words,
                        onChanged: (name) => bloc.add(ServicesFieldNameChanged(name)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.mobileNo != current.mobileNo,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.mobileNo,
                        keyboardType: TextInputType.number,
                        prefixText: '09',
                        isValid: state.isMobileNoValid,
                        onChanged: (mobileNo) => bloc.add(ServicesMobileNoChanged(mobileNo)),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(9)],
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
                    buildWhen: (previous, current) => previous.typeOfCounseling != current.typeOfCounseling,
                    builder: (context, state) {
                      return SampiroDropDown(
                        label: l10n.typeOfCounseling,
                        isValid: state.isTypeOfCounselingValid,

                        dropDownMenuItem: [
                          DropdownMenuItem<String>(
                            value: l10n.addiction,
                            child: Text(l10n.addiction),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.career,
                            child: Text(l10n.career),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.crisis,
                            child: Text(l10n.crisis),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.grief,
                            child: Text(l10n.grief),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.marriageAndFamily,
                            child: Text(l10n.marriageAndFamily),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.mentalHealth,
                            child: Text(l10n.mentalHealth),
                          ),
                          DropdownMenuItem<String>(
                            value: l10n.trauma,
                            child: Text(l10n.trauma),
                          ),
                        ],
                        onChanged: (value) {
                          if (value == null) return;
                          bloc.add(ServicesTypeOfCounselingChanged(value));
                        },
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) =>
                        previous.preferredCounselingDate != current.preferredCounselingDate,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.preferredCounselingDate,
                        isValid: state.isPreferredCounselingDateValid,
                        keyboardType: TextInputType.number,
                        hintText: l10n.mmddyyyy,
                        inputFormatters: [monthDateYearFormatter],
                        onChanged: (preferredCounselingDate) =>
                            bloc.add(ServicesPreferredCounselingDateChanged(preferredCounselingDate)),
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) =>
                        previous.preferredCounselingTime != current.preferredCounselingTime ||
                        previous.formattedTime != current.formattedTime,
                    builder: (context, state) {
                      return SampiroTimePicker(
                        initialValue: state.formattedTime,
                        label: l10n.preferredCounselingTime,
                        isValid: state.isPreferredCounselingTimeValid,
                        onTimeSelected: (value) {
                          bloc.add(ServicesPreferredCounselingTimeChanged(value));
                        },
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.isRequestValid != current.isRequestValid,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: state.isRequestValid
                              ? () {
                                  bloc.add(const ServicesSubmitted('counseling'));
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
