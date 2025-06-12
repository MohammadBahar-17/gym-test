import 'package:flutter/material.dart';
import 'package:quizmax/data/questions.dart';
import 'package:quizmax/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final void Function() onRestart;
  List<String> chosenAnswers;

  ResultsScreen(this.onRestart, this.chosenAnswers, {super.key});
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summaryData = getSummaryData();
    int numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answer $numCorrectAnswers out of ${questions.length} questions correctly',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 30.0),
            TextButton.icon(
              onPressed: () {
                onRestart();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                iconSize: 28,
              ),
              icon: Icon(Icons.restart_alt),
              label: Text('Restart the quiz', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
