import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Question {
  final String question;
  final List<String> choices;
  final String answer;

  Question({
    required this.question,
    required this.choices,
    required this.answer,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> questions = [
    Question(
      question: 'What is the traditional color associated with Christmas',
      choices: [' Red', 'Green', 'Blue', 'Yellow'],
      answer: 'Red',
    ),
    Question(
      question: 'What is the name of the famous reindeer with a red nose',
      choices: ['Prancer', 'Dasher', 'Rudolph', 'Vixen'],
      answer: 'Rudolph',
    ),
    Question(
      question: 'Which country is credited with starting the tradition of putting up a Christmas tree',
      choices: ['United States', 'Germany', 'England', 'France'],
      answer: 'Germany',
    ),
    Question(
      question: 'What is the traditional Christmas meal in the United States',
      choices: ['Turkey', 'Ham', 'Roast beef', 'Chicken'],
      answer: 'Turkey',
    ),
    Question(
      question: 'What is the name of the famous Christmas ballet featuring a young girl and her nutcracker prince',
      choices: ['Swan Lake', 'The Nutcracker', 'Sleeping Beauty', 'Giselle'],
      answer: 'The Nutcracker',
    ),
    Question(
      question: 'What is the date of Christmas Day',
      choices: ['December 31st', 'December 26th', 'December 24th', 'December 25th'],
      answer: 'December 25th',
    ),
    Question(
      question: 'How many days are there in the Twelve Days of Christmas',
      choices: ['10', '8', '12', '6'],
      answer: '12',
    ),
    Question(
      question: 'What is the name of the plant often associated with Christmas and is known for its red and green leaves',
      choices: ['Rose', 'Poinsettia', 'Orchid', 'Tulip'],
      answer: 'Poinsettia',
    ),
    Question(
      question: 'Which song is commonly sung at the end of a Christmas party or gathering',
      choices: ['Silent Night', 'Jingle Bells', 'We Wish You a Merry Christmas', 'Deck the Halls'],
      answer: 'We Wish You a Merry Christmas',
    ),
     Question(
      question: 'What is the name of the character who tries to stop Christmas from coming in Dr. Seuss’ book “How the Grinch Stole Christmas!',
      choices: ['Grinch', 'Scrooge', 'Frosty', 'Santa Claus'],
      answer: 'Grinch',
    ),
    // ... (additional questions)
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ผลคะแนน'),
            content: Text('คุณตอบถูก $score จาก ${questions.length} ข้อ'),
            actions: <Widget>[
              TextButton(
                child: Text('ปิด'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void checkAnswer(String answer) {
    if (answer == questions[currentQuestionIndex].answer) {
      score++;
    }
    nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[currentQuestionIndex].question,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Column(
            children: questions[currentQuestionIndex].choices.map((choice) {
              return ElevatedButton(
                onPressed: () {
                  checkAnswer(choice);
                },
                child: Text(choice),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
