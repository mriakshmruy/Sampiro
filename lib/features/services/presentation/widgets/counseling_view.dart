import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/utils/input_formatter.dart';
import 'package:sampiro/core/widgets/sampiro_drop_down.dart';
import 'package:sampiro/core/widgets/sampiro_text_field.dart';
import 'package:sampiro/core/widgets/sampiro_time_picker.dart';
import 'package:sampiro/l10n/l10n.dart';

class CounselingView extends StatelessWidget {
  const CounselingView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
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

          SampiroTextField(
            label: l10n.name1,
            textCapitalization: TextCapitalization.words,
          ),

          SampiroTextField(
            label: l10n.mobileNo,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(11)],
          ),
          SampiroTextField(
            label: l10n.address,
          ),
          SampiroDropDown(
            label: l10n.typeOfCounseling,
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
            onChanged: (value) {},
          ),
          SampiroTextField(
            label: l10n.preferredCounselingDate,
            keyboardType: TextInputType.number,
            hintText: l10n.mmddyyyy,
            inputFormatters: [monthDateYearFormatter],
          ),

          SampiroTimePicker(
            label: l10n.preferredCounselingTime,

            onTimeSelected: (value) => value,
          ),

          Padding(
            padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
            child: ElevatedButton(onPressed: () {}, child: Text(l10n.submit)),
          ),
        ],
      ),
    );
  }
}
