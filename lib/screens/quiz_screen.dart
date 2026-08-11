import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quiz_cubit.dart';
import '../cubit/quiz_state.dart';
import '../widgets/option_tile.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Quiz')),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          final question = cubit.questions[state.currentIndex];
          final total = cubit.questions.length;
          final answered = state.status != AnswerStatus.unanswered;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  'Question ${state.currentIndex + 1} / $total',
                  style: TextStyle(color: const Color.fromARGB(255, 5, 5, 5), fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  question.text,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

               
                ...List.generate(question.options.length, (index) {
                  return OptionTile(
                    text: question.options[index],
                    index: index,
                    correctIndex: question.correctIndex,
                    selectedIndex: state.selectedOptionIndex,
                    status: state.status,
                    onTap: () => cubit.selectAnswer(index),
                  );
                }),

                const SizedBox(height: 16),

               
                if (answered)
                  Text(
                    state.status == AnswerStatus.correct
                        ? 'Correct'
                        : 'Wrong',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: state.status == AnswerStatus.correct
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),

                const Spacer(),

                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: answered ? cubit.nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      state.currentIndex == total - 1
                          ? 'Finish'
                          : 'Next Question',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
