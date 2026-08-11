/// A single multiple-choice quiz question.
class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}


const List<Question> quizQuestions = [
  Question(
    text: 'Which keyword is used to define a variable that cannot be reassigned in Dart?',
    options: ['var', 'final', 'dynamic', 'static'],
    correctIndex: 1,
  ),
  Question(
    text: 'Which widget is used to add space between widgets?',
    options: ['SizedBox', 'Scaffold', 'Material', 'Center'],
    correctIndex: 0,
  ),
  Question(
    text: 'Which widget allows you to detect user taps?',
    options: ['Text', 'GestureDetector', 'Column', 'Expanded'],
    correctIndex: 1,
  ),
  Question(
    text: 'Which keyword is used to handle errors in Dart?',
    options: ['catch', 'error', 'handle', 'except'],
    correctIndex: 0,
  ),
  Question(
    text: 'Which widget makes its child take the available space in a Row or Column?',
    options: ['Container', 'Expanded', 'Padding', 'Center'],
    correctIndex: 1,
  ),
];

