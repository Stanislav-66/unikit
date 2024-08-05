import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unikit/generated/l10n.dart';
import 'package:unikit/routers/routers.dart';

import '../../app/notification/notification_push.dart';
import '../speciality_screen/model/pdf_document.dart';
import '../widgets/app_bar_center.dart';


@RoutePage()
class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {

  List<PDFDocument> documents = [
    PDFDocument('3515 УниКит',
        'https://drive.google.com/uc?id=1s0cr_RkM5T7KdRAym03w86hcPVzHglQQ&export=download'),
    PDFDocument('3658',
        'https://drive.google.com/uc?id=1Wy87BIUEoFiXaZhim1gIuu_VKLUoL4vW&export=download'),
    PDFDocument('3671 (2)',
        'https://drive.google.com/uc?id=1atGAoeVUa4QTCi_osnFJ-htG2kKQltPj&export=download'),
    PDFDocument('3676',
        'https://drive.google.com/uc?id=19fUAzUc_zw1qsjtSpDcxZ0c2eKsMcCil&export=download'),
    PDFDocument('Приказ№ 154-д от 30.03.2023 г.',
        'https://drive.google.com/uc?id=1QpsJOkXTjaHC2Vnyv5jWje22Yiv7Y97B&export=download'),
  ];

  Future<void> downloadPDF(String url, String name, BuildContext context) async {
    Dio dio = Dio();
    try {
      final response = await dio.get(url, options: Options(responseType: ResponseType.bytes));

      var documentsPath = await getApplicationDocumentsDirectory();

      final file = await File('${documentsPath.path}/$name.pdf').create();
      print(file.path);
      await file.writeAsBytes(response.data);

      if (context.mounted) {
        final notificationService = context.read<NotificationService>();
        notificationService.notificationId++;
        await notificationService.notificationsManager.showNotification(
          title: S.of(context).title_coledge,
          body: S.of(context).dowload_mes,
          notificationId: notificationService.notificationId,
        );
        Fluttertoast.showToast(msg: S.of(context).pdf_dowload);
      }
    } catch (e) {
      print('Error downloading PDF: $e');
      if (context.mounted) {
        Fluttertoast.showToast(msg: S.of(context).failed_dowload_pdf);
      }
    }
  }

  void addDocument() async {
    final PDFDocument? newDocument = await showDialog<PDFDocument>(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        String url = '';
        return AlertDialog(
          title: Text(S.of(context).add_title_doc),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: S.of(context).name_doc),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: S.of(context).url_doc),
                onChanged: (value) {
                  url = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(PDFDocument(name, url));
              },
              child: Text(S.of(context).add),
            ),
          ],
        );
      },
    );

    if (newDocument != null) {
      setState(() {
        documents.add(newDocument);
      });
    }
  }

  void replaceDocument(int index) async {
    final PDFDocument? newDocument = await showDialog<PDFDocument>(
      context: context,
      builder: (BuildContext context) {
        String name = documents[index].name;
        String url = documents[index].url;
        TextEditingController nameController = TextEditingController(text: name);
        TextEditingController urlController = TextEditingController(text: url);
        return AlertDialog(
          title: Text(S.of(context).replaceDocument),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: S.of(context).name_doc),
              ),
              TextField(
                controller: urlController,
                decoration: InputDecoration(labelText: S.of(context).url_doc),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(PDFDocument(nameController.text, urlController.text));
              },
              child: Text(S.of(context).replace),
            ),
          ],
        );
      },
    );

    if (newDocument != null) {
      setState(() {
        documents[index] = newDocument;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).special_090307,
          backgroundColor: theme.colorScheme.primary,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: addDocument,
            ),
          ],
          padding: 0,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(S.of(context).enrollment, style: theme.textTheme.titleMedium),
            ),
            ...documents.map((document) {
              int index = documents.indexOf(document);
              return Card(
                child: ListTile(
                  leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/icons/pdf_icon.png")),
                  title: Center(child: Text(document.name, style: theme.textTheme.bodyMedium, textAlign: TextAlign.center,)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          replaceDocument(index);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          downloadPDF(document.url, document.name, context);
                        },
                        icon: const Icon(Icons.download),
                      ),
                    ],
                  ),
                  onTap: () {
                    AutoRouter.of(context).push(PDFViewerRoute(url: document.url));
                  },
                ),
              );
            }),
          ],
        )
    );
  }
}
