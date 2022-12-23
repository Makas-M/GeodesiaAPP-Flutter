import 'dart:convert';
import 'package:app/QUIZ/modelo.dart';
import 'package:http/http.dart' as http;

class DBConnection {
  final url = Uri.parse(
      'https://quizgeo-46521-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async {
    http.post(
      url,
      body: json.encode({
        'title': question.title,
        'options': question.options,
      }),
    );
  }
}
