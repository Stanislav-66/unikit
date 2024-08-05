
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unikit/generated/l10n.dart';

import '../widgets/widgets.dart';
import 'widgets/widgets.dart';


@RoutePage()
class SpecialityScreen extends StatefulWidget {
  const SpecialityScreen({super.key});

  @override
  State<SpecialityScreen> createState() => _SpecialityScreenState();
}

class _SpecialityScreenState extends State<SpecialityScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).special_090307,
        backgroundColor: theme.colorScheme.primary,
        padding: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).title090207,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).name_special,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).data_special_table,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).budhet),
                      Text(S.of(context).payment),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ImageResize.buildCard(
            context,
            'assets/images/special/programist.jpg',
            S.of(context).text_speciality1,
            MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height * 0.3,
          ),
          ImageResize.buildCard(
            context,
            'assets/images/special/vanya.jpg',
            S.of(context).text_speciality2,
            MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height * 0.2,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              S.of(context).list_point_tittle1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...ListPoint.buildProfessionalFields([
            S.of(context).list_point1_item1,
            S.of(context).list_point1_item2,
            S.of(context).list_point1_item3,
            S.of(context).list_point1_item4,
            S.of(context).list_point1_item5,
            S.of(context).list_point1_item6,
            S.of(context).list_point1_item7,
            S.of(context).list_point1_item8,
          ]),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).data_special,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).list_point_tittle2,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          ...ListPoint.buildProfessionalFields([
            S.of(context).list_point2_item1,
            S.of(context).list_point2_item2,
            S.of(context).list_point2_item3,
            S.of(context).list_point2_item4,
            S.of(context).list_point2_item5,
            S.of(context).list_point2_item6,
            S.of(context).list_point2_item7,
          ]),

        ],
      ),
    );
  }
}
