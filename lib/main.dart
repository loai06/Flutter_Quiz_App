/* 
20241700653
level2
لؤي السيد محمد سعد الدين
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/quiz_cubit.dart';
import 'cubit/quiz_state.dart';
import 'models/question.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, 
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black, 
      ),
      home: BlocProvider(
        create: (_) => QuizCubit(questions: quizQuestions),
        child: const QuizFlow(),
      ),
    );
  }
}


class QuizFlow extends StatelessWidget {
  const QuizFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state.isFinished) {
          return ResultScreen(
            score: state.score,
            total: context.read<QuizCubit>().questions.length,
          );
        }
        return const QuizScreen();
      }, 
    );
  }
}
