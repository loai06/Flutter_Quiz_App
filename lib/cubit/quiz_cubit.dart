import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/question.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final List<Question> questions;

  QuizCubit({required this.questions}) : super(QuizState.initial());

  Question get currentQuestion => questions[state.currentIndex];


  void selectAnswer(int index) {
    
    if (state.status != AnswerStatus.unanswered) return;

    final isCorrect = index == currentQuestion.correctIndex;

    emit(
      state.copyWith(
        status: isCorrect ? AnswerStatus.correct : AnswerStatus.wrong,
        selectedOptionIndex: index,
        score: isCorrect ? state.score + 1 : state.score,
      ),
    );
  }


  void nextQuestion() {
    final isLastQuestion = state.currentIndex >= questions.length - 1;

    if (isLastQuestion) {
      emit(state.copyWith(isFinished: true));
      return;
    }

    emit(
      state.copyWith(
        currentIndex: state.currentIndex + 1,
        status: AnswerStatus.unanswered,
        selectedOptionIndex: null,
      ),
    );
  }

  void resetQuiz() {
    emit(QuizState.initial());
  }
}
