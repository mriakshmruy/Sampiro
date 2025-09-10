import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/widgets/sampiro_drop_down.dart';
import 'package:sampiro/core/widgets/sampiro_text_field.dart';
import 'package:sampiro/core/widgets/sampiro_time_picker.dart';
import 'package:sampiro/l10n/l10n.dart';

class ScheduleABlessingView extends StatelessWidget {
  const ScheduleABlessingView({super.key});

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

          SampiroDropDown(
            label: l10n.property,
            dropDownMenuItem: [
              DropdownMenuItem<String>(value: l10n.businessStore, child: Text(l10n.businessStore)),
              DropdownMenuItem<String>(value: l10n.houseCondo, child: Text(l10n.houseCondo)),
              DropdownMenuItem<String>(value: l10n.office, child: Text(l10n.office)),
              DropdownMenuItem<String>(value: l10n.others, child: Text(l10n.others)),
            ],

            onChanged: (value) {},
          ),

          SampiroTextField(
            label: l10n.name1,
          ),

          SampiroDropDown(
            label: l10n.barangay,
            dropDownMenuItem: [
              DropdownMenuItem<String>(value: l10n.olympia, child: Text(l10n.olympia)),
              DropdownMenuItem<String>(value: l10n.poblacion, child: Text(l10n.poblacion)),
              DropdownMenuItem<String>(value: l10n.valenzuela, child: Text(l10n.valenzuela)),
            ],
            onChanged: (value) {},
          ),

          SampiroTextField(
            label: l10n.address,
          ),

          SampiroTextField(
            label: l10n.mobileNo,
          ),

          SampiroTextField(
            label: l10n.dateOfBlessing,
          ),

          SampiroTimePicker(
            label: l10n.timeOfBlessing,
          ),

          SampiroTextField(
            label: l10n.religion,
          ),

          SampiroTextField(
            label: l10n.reason,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(onPressed: () {}, child: Text(l10n.submit)),
          ),
        ],
      ),
    );
  }
}
