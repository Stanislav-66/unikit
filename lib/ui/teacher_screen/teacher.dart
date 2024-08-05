import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikit/generated/l10n.dart';
import 'package:unikit/ui/widgets/app_bar_center.dart';

@RoutePage()
class TeachersScreen extends StatefulWidget {
  const TeachersScreen({super.key});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).teachers,
        backgroundColor: theme.colorScheme.primary,
        padding: 0,
      ),
      body: ListView(
        children:  [
          Padding(padding: const EdgeInsets.all(10), child: Text(
            S.of(context).teacher_list,
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).gluscer,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).director,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).valeev,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).dzuba,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).kuzma,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).larionova,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).plahutina,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).podobin,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),

          ListTile(
            title: Text(
              S.of(context).sabirhanova,
                style: theme.textTheme.bodyMedium
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              S.of(context).hustochka,
                style: theme.textTheme.bodyMedium
            ),
          ),
        ],
      )
    );
  }
}