import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}
class QuizAppModel {
  final String? question;
  final List <String>? options;
  final int? answerIndex;
  const QuizAppModel({this.question,this.options,this.answerIndex});
}
class _QuizAppState extends State<QuizApp> {
  List allQuestions = [
    const QuizAppModel(
      question: "When was Flutter first introduced to the public?",
      options: ["2013", "2015", "2017", "2019"],
      answerIndex: 1,
    ),
    const QuizAppModel(
      question: "Which widget is commonly used for creating scrollable lists in Flutter?",
      options: ["ListView", "GridView", "Column", "Row"],
      answerIndex: 0,
    ),
    const QuizAppModel(
      question: "What was the original name of Flutter during its early development?",
      options: ["Sky", "DartUI", "Pixel", "Swift"],
      answerIndex: 0,
    ),
    const QuizAppModel(
      question:"Which command is used to run a Flutter app in debug mode?",
      options:["flutter debug","flutter start","flutter launch","flutter run"],
      answerIndex:3,
    ),
     const QuizAppModel(
      question:  "What command is used to create a new Flutter project from the command line?",
      options:["flutter start","flutter new","flutter create","flutter project"],
      answerIndex:2,
     ),
 ];
  bool questionScreen = true;
  int questionIndex = 0;
  int answersCount = 0;
  int selectedAnswerIndex = -1;

  Color? chooseAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex].answerIndex) {
        return Colors.green;
      } else if (buttonIndex == selectedAnswerIndex) {
        return Colors.red;
      } else {
        return Colors.white;
      }
    } else {
      return Colors.white;
    }
  }
  void funcNextQuestion() {
    if (selectedAnswerIndex == -1) {
      return;
    }
    if (selectedAnswerIndex == allQuestions[questionIndex].answerIndex) {
      answersCount += 1;
    }
    setState(() {
      if (questionIndex == allQuestions.length - 1) {
        questionScreen = false;
      }
      questionIndex++;
      selectedAnswerIndex = -1;
    });
  }
  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.white
                ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Question : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.right,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 80,
              child: Text(
                allQuestions[questionIndex].question,
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: chooseAnswer(0),
                fixedSize: const Size(250, 50),
                foregroundColor: Colors.black,
              ),
              child: Text(
                "i. ${allQuestions[questionIndex].options[0]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: chooseAnswer(1),
                foregroundColor: Colors.black,
                fixedSize: const Size(250, 50),
              ),
              child: Text(
                "ii. ${allQuestions[questionIndex].options[1]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400,),
                    textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: chooseAnswer(2),
                foregroundColor: Colors.black,
                fixedSize: const Size(250, 50),
              ),
              child: Text(
                "iii. ${allQuestions[questionIndex].options[2]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: chooseAnswer(3),
                foregroundColor: Colors.black,
                fixedSize: const Size(250, 50),
              ),
              child: Text(
                "iv. ${allQuestions[questionIndex].options[3]}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: funcNextQuestion,
          backgroundColor: Colors.black,
           child:  const Icon(
            Icons.forward,
            color: Colors.white,
          ),
          
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            
            Image.network(
              "https://www.shutterstock.com/image-vector/golden-cup-trophy-on-stack-600nw-1991132597.jpg",
               width: 500,
             height: 300,
            ),
            const Text(
              "Congratulations!!!",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "You have answered $answersCount out of ${allQuestions.length} questions correctly.",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                ),
                textAlign:TextAlign.center ,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                  answersCount = 0;
                  questionScreen = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: const Size(100, 30),
              ),
              child: const Text("Restart"),
            )
          ],
        ),
      );
    }
  }
@override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
