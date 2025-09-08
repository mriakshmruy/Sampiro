import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/core/routes/app_router.dart';
import 'package:sampiro/core/widgets/sampiro_drop_down.dart';
import 'package:sampiro/core/widgets/sampiro_text_field.dart';
import 'package:sampiro/core/widgets/sampiro_time_picker.dart';
import 'package:sampiro/l10n/l10n.dart';

class AnointingOfTheSickView extends StatelessWidget {
  const AnointingOfTheSickView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
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

          SampiroTextField(
            label: l10n.nameOfTheSickPerson,
          ),

          SampiroDropDown(
            label: l10n.barangay,
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
            onChanged: (value) {},
          ),

          SampiroTextField(
            label: l10n.address,
          ),

          SampiroTextField(
            label: l10n.age,
          ),

          SampiroTextField(
            label: l10n.sickness,
          ),

          SampiroTextField(
            label: l10n.nameOfRequestingPerson,
          ),

          SampiroTextField(
            label: l10n.relationshipWithTheSick,
          ),

          SampiroTextField(
            label: l10n.contactNumberOfRequestingPerson,
          ),

          SampiroTextField(
            label: l10n.dateOfAnointing,
          ),

          SampiroTimePicker(
            label: l10n.timeOfAnointing,
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
