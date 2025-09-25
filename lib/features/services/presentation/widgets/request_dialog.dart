import 'package:flutter/material.dart';
import 'package:sampiro/core/keys/sampiro_keys.dart';

class RequestDialog extends StatelessWidget {
  const RequestDialog({required this.docRefId, super.key, this.onPressed});

  final String docRefId;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Request Submitted'),
      content: Text('Reference no. $docRefId '),
      actions: [
        TextButton(
          key: SampiroKeys.requestDialogKey,
          onPressed: onPressed,
          child: const Text('ok'),
        ),
      ],
    );
  }
}
