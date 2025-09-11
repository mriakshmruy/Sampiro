import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/utils/input_formatter.dart';
import 'package:sampiro/core/widgets/sampiro_page_loader.dart';
import 'package:sampiro/core/widgets/sampiro_text_field.dart';
import 'package:sampiro/features/dashboard/presentation/bloc/bloc.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/features/services/presentation/widgets/request_dialog.dart';
import 'package:sampiro/l10n/l10n.dart';

class BaptismalCertificateView extends StatelessWidget {
  const BaptismalCertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ServicesBloc>();
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return BlocListener<ServicesBloc, ServicesState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.docRefId != current.docRefId ||
          previous.errorMessage != current.errorMessage,
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
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    context.router.push(const ServicesRoute());
                  },
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    l10n.baptismalCertificateRequest,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  Text(l10n.top),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.fieldName != current.fieldName,
                    builder: (context, state) {
                      return SampiroTextField(
                        isValid: state.isNameValid,
                        icon: const Icon(Icons.verified_user),
                        label: l10n.name1,
                        textCapitalization: TextCapitalization.words,
                        onChanged: (fieldName) {
                          bloc.add(ServicesFieldNameChanged(fieldName));
                        },
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.fieldDate != current.fieldDate,
                    builder: (context, state) {
                      return SampiroTextField(
                        isValid: state.isFieldDateValid,
                        label: l10n.dateOfBaptism,
                        keyboardType: TextInputType.number,

                        hintText: l10n.mmddyyyy,
                        onChanged: (fieldDate) {
                          bloc.add(ServicesFieldDateChanged(fieldDate));
                        },
                        inputFormatters: [
                          monthDateYearFormatter,
                        ],
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.fieldDateOfBirth != current.fieldDateOfBirth,
                    builder: (context, state) {
                      return SampiroTextField(
                        isValid: state.isFieldDateOfBirthValid,
                        label: l10n.dateOfBirth,
                        keyboardType: TextInputType.number,
                        hintText: l10n.mmddyyyy,
                        onChanged: (fieldDateOfBirth) {
                          bloc.add(ServicesFieldDateOfBirthChanged(fieldDateOfBirth));
                        },
                        inputFormatters: [
                          monthDateYearFormatter,
                        ],
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.remarks != current.remarks,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.dateRemarks,
                        hintText: l10n.remarks,
                        isValid: state.isRemarksValid,
                        onChanged: (remarks) {
                          bloc.add(ServicesRemarksChanged(remarks));
                        },
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.placeOfBirth != current.placeOfBirth,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.placeOfBirth,
                        isValid: state.isPlaceOfBirthValid,
                        onChanged: (placeOfBirth) {
                          bloc.add(ServicesPlaceOfBirthChanged(placeOfBirth));
                        },
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.nameOfFather != current.nameOfFather,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.nameOfFather,
                        isValid: state.isNameOfFatherValid,
                        onChanged: (nameOfFather) {
                          bloc.add(ServicesNameOfFatherChanged(nameOfFather));
                        },
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.nameOfMother != current.nameOfMother,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.nameOfMother,
                        isValid: state.isNameOfMotherValid,
                        onChanged: (nameOfMother) {
                          bloc.add(ServicesNameOfMotherChanged(nameOfMother));
                        },
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.purpose != current.purpose,
                    builder: (context, state) {
                      return SampiroTextField(
                        autofocus: true,

                        label: l10n.purpose,
                        isValid: state.isPurposeValid,
                        onChanged: (purpose) {
                          bloc.add(ServicesPurposeChanged(purpose));
                        },
                      );
                    },
                  ),

                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.mobileNo != current.mobileNo,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.mobileNo,
                        keyboardType: TextInputType.number,
                        isValid: state.isMobileNoValid,
                        onChanged: (mobileNo) {
                          bloc.add(ServicesMobileNoChanged(mobileNo));
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.emailAddress != current.emailAddress,
                    builder: (context, state) {
                      return SampiroTextField(
                        label: l10n.emailAddress,
                        isValid: state.isEmailAddressValid,
                        onChanged: (emailAddress) {
                          bloc.add(ServicesEmailAddressChanged(emailAddress));
                        },
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 16)),
                  BlocBuilder<ServicesBloc, ServicesState>(
                    buildWhen: (previous, current) => previous.isFormValid != current.isFormValid,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.isFormValid
                            // TODO(Kashmir): this is ternary operator
                            ? () {
                                bloc.add(const ServicesSubmitted('baptism'));
                              }
                            : null,

                        child: Text(l10n.submit),
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
