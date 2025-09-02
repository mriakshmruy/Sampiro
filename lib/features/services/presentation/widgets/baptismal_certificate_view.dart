import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/utils/input_formatter.dart';
import 'package:sampiro/core/widgets/sampiro_text_field.dart';
import 'package:sampiro/features/dashboard/presentation/bloc/bloc.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/l10n/l10n.dart';

class BaptismalCertificateView extends StatelessWidget {
  const BaptismalCertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ServicesBloc>();
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.parishServices,
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.surface),
        ),
        centerTitle: true,
        leading: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              context.router.push(const ServicesRoute());
            },
          ),
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
                  bloc.add(ServicesEvent.fieldDateChanged(fieldDate));
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
                  bloc.add(ServicesEvent.fieldDateOfBirthChanged(fieldDateOfBirth));
                },
                inputFormatters: [
                  monthDateYearFormatter,
                ],
              );
            },
          ),
          SampiroTextField(
            label: l10n.dateRemarks,
            hintText: l10n.remarks,
          ),
          BlocBuilder<ServicesBloc, ServicesState>(
            buildWhen: (previous, current) => previous.placeOfBirth != current.placeOfBirth,
            builder: (context, state) {
              return SampiroTextField(
                label: l10n.placeOfBirth,
              );
            },
          ),
          SampiroTextField(
            label: l10n.nameOfFather,
          ),
          SampiroTextField(
            label: l10n.nameOfMother,
          ),
          SampiroTextField(
            label: l10n.purpose,
          ),
          SampiroTextField(
            label: l10n.dateOfBaptism,
          ),
          SampiroTextField(
            label: l10n.mobileNo,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
          ),
          SampiroTextField(
            label: l10n.emailAddress,
          ),
          const Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 16)),
          ElevatedButton(
            onPressed: () {},
            child: Text(l10n.submit),
          ),
        ],
      ),
    );
  }
}
