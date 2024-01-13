
class Question{

  final String id;
  //every question will have a title and the question itself 
  final String title;
  //every question will have option
  final Map<String,String> options;

  //options will be like ( 1 true , 2 false ) = something like these 

  Question ({
    required this.id,
    required this.title,
    required this.options,

  });
  // override the toString method to print the question on console 
  @override 
  String toString(){
    return 'Question(id : $id , title : $title , options : $options)';
  }
}