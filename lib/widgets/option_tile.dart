import 'package:flutter/material.dart';

import '../cubit/quiz_state.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final int index;
  final int correctIndex;
  final int? selectedIndex;
  final AnswerStatus status;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.text,
    required this.index,
    required this.correctIndex,
    required this.selectedIndex,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final answered = status != AnswerStatus.unanswered;

    Color backgroundColor = const Color.fromRGBO(243, 238, 238, 1);
    Color borderColor = const Color.fromARGB(255, 8, 8, 8);

    if (answered) {
      final isCorrectOption = index == correctIndex;
      final isSelectedOption = index == selectedIndex;

      if (isCorrectOption) {
        
        backgroundColor = Colors.green.shade100;
        borderColor = Colors.green;
      } else if (isSelectedOption) {
        
        backgroundColor = Colors.red.shade100;
        borderColor = Colors.red;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        
        onTap: answered ? null : onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(text, style: const TextStyle(fontSize: 16,color: Colors.black)),
              ),
              if (answered && index == correctIndex)
                const Icon(Icons.check_circle, color: Colors.green),
              if (answered &&
                  index == selectedIndex &&
                  index != correctIndex)
                const Icon(Icons.cancel, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
