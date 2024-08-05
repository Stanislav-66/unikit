import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:unikit/generated/l10n.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(S.of(context).error_mes),
        IconButton(onPressed: (){
          Restart.restartApp();
        }, icon: const Icon(Icons.update))
      ],
    );
  }
}
