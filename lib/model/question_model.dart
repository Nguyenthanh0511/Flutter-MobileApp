class Question {
  final String id;
  // Every question will have a title and the question itself.
  final String title;
  // Every question will have options.
  final Map<String, String> options;
  // Options will be like (1 true, 2 false) = something like these.
  final String correctAnswer;

  // Constructor for the Question class.
  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.correctAnswer,
  });

  // Override the toString method to provide a string representation of the object.
  // This is useful for debugging purposes.
  // @override
  // String toString() {
  //   return 'Question(id: $id, title: $title, options: $options, correctAnswer: $correctAnswer)';
  // }
}
