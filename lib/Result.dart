import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetit;
  Result(this.resultscore, this.resetit);
  String get res {
    String r;
    if (resultscore >= 3)
      r = 'Awesome!';
    else
      r = 'Better luck next time!';
    return r;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              res,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
              color: Colors.blue,
              child: Text(
                'RESET QUIZ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: resetit),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Your Score \n       ' + resultscore.toString() + '/5',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
