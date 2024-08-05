
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


import 'package:unikit/generated/l10n.dart';
import 'package:unikit/ui/widgets/app_bar_center.dart';


@RoutePage()
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).contact,
        backgroundColor: theme.colorScheme.primary,
        padding: 0,
      ),
      body: ListView(
        children:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).contact_adress, style: theme.textTheme.bodyMedium?.copyWith()),
                      Text(S.of(context).adress1, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).thoroughfare),
                      Text(S.of(context).adress2),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).phone_number),
                      const Text("+7(985)197-97-58, +7(915)405-46-06, 8(495)640-54-36 ext. 4846"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).email_static),
                      const Text("priemka@mgkit.ru"),
                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      )
    );
  }
}
