class QuizQuestion {
  const QuizQuestion({required this.question, required this.answer});

  final String question;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    final shuffeldList = List.of(answer);
    shuffeldList.shuffle();
    return shuffeldList;
  }
}
