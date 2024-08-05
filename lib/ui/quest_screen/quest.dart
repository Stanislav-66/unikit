import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unikit/generated/l10n.dart';


@RoutePage()
class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(S.of(context).question_title, style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),)),
        backgroundColor: theme.colorScheme.primary,
        iconTheme: theme.iconTheme,
      ),
      body: ListView(
        children: <Widget>[
          QuestionAnswerWidget(
            question: S.of(context).q1,
            answer: S.of(context).answer1,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q2,
            answer: S.of(context).answer2,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q3,
            answer: S.of(context).answer3,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q4,
            answer: S.of(context).answer4,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q5,
            answer: S.of(context).answer5,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q6,
            answer: S.of(context).answer6,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q7,
            answer: S.of(context).answer7,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q8,
            answer: S.of(context).answer8,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q9,
            answer: S.of(context).answer9,
          ),
          QuestionAnswerWidget(
            question: S.of(context).q10,
            answer: S.of(context).answer10,
          ),
        ],
      ),
    );
  }
}
class QuestionAnswerWidget extends StatefulWidget {
  final String question;
  final String answer;

  const QuestionAnswerWidget({super.key, required this.question, required this.answer});

  @override
  _QuestionAnswerWidgetState createState() => _QuestionAnswerWidgetState();
}

class _QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleExpanded,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.question,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            if (isExpanded)
              Text(
                widget.answer,
              ),
          ],
        ),
      ),
    );
  }
}