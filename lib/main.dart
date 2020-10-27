import 'package:flutter/material.dart';
import './Result.dart';

void main() {
  runApp(QuizBiz());
}

class QuizBiz extends StatefulWidget {
  @override
  _QuizBizState createState() => _QuizBizState();
}

class _QuizBizState extends State<QuizBiz> {
  @override
  int flag = 0, tscore = 0;
  void selectHandler(score) {
    setState(() {
      flag = flag + 1;
      tscore += score;
    });
  }

  void reset() {
    setState(() {
      flag = 0;
      tscore = 0;
    });
  }

  List<Map<String, Object>> qna = [
    {
      'que': 'Who is the author of \'Bloodline\' ?',
      'ans': [
        {'text': 'Artur Conan Doyle', 'score': 0},
        {'text': 'Agatha Christie', 'score': 0},
        {'text': 'Dan Brown', 'score': 0},
        {'text': 'Sidney Sheldon', 'score': 1}
      ]
    },
    {
      'que': 'Who was Hermione\'s date at the Yule Ball ?',
      'ans': [
        {'text': 'Harry Potter', 'score': 0},
        {'text': 'Ron Weasely', 'score': 0},
        {'text': 'Victor Krum', 'score': 1},
        {'text': 'Cedric Diggory', 'score': 0}
      ]
    },
    {
      'que':
          'Which character dies at the end of the movie \'Pirates Of The Caribbean: Salazar\'s Revenge\' ?',
      'ans': [
        {'text': 'Will Turner', 'score': 0},
        {'text': 'Elizabeth Swann', 'score': 0},
        {'text': 'Captain Barbossa', 'score': 1},
        {'text': 'Tia Dalma', 'score': 0}
      ]
    },
    {
      'que': 'Which one of them is a work of Sir Artur Conan Doyle ?',
      'ans': [
        {'text': 'Inferno', 'score': 0},
        {'text': 'And then there were none', 'score': 0},
        {'text': 'The adventures of Sherlock Holmes', 'score': 1},
        {'text': 'Tomorrow never comes', 'score': 0}
      ]
    },
    {
      'que': 'Who among them is/are Akanksha\'s favourite :D ?',
      'ans': [
        {'text': 'Chris Hemsworth', 'score': 0},
        {'text': 'Luka Doncic', 'score': 0},
        {'text': 'Chris Evans', 'score': 0},
        {'text': 'All of them', 'score': 1}
      ]
    },
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  'QuizBiz',
                ),
              ),
            ),
            body: flag < qna.length
                ? Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 8,
                        right: 8,
                      ),
                      child: Text(
                        qna[flag]['que'], //question
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...(qna[flag]['ans'] as List<Map<String, Object>>)
                        .map((ans) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 350,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                ans['text'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => selectHandler(ans['score']),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                          'Your Score \n       ' + tscore.toString() + '/5',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ])
                : Result(tscore, reset)));
  }
}
