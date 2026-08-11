import 'package:equatable/equatable.dart';

/// Whether the current question has been answered yet, and if so, how.
enum AnswerStatus { unanswered, correct, wrong }

class QuizState extends Equatable {
  final int currentIndex;
  final int score;
  final AnswerStatus status;
  final int? selectedOptionIndex;
  final bool isFinished;

  const QuizState({
    required this.currentIndex,
    required this.score,
    required this.status,
    required this.selectedOptionIndex,
    required this.isFinished,
  });

  /// The starting state: first question, zero score, nothing answered yet.
  factory QuizState.initial() => const QuizState(
        currentIndex: 0,
        score: 0,
        status: AnswerStatus.unanswered,
        selectedOptionIndex: null,
        isFinished: false,
      );

  QuizState copyWith({
    int? currentIndex,
    int? score,
    AnswerStatus? status,
    int? selectedOptionIndex,
    bool? isFinished,
  }) {
    return QuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      status: status ?? this.status,

      selectedOptionIndex: selectedOptionIndex,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  List<Object?> get props =>
      [currentIndex, score, status, selectedOptionIndex, isFinished];
}
