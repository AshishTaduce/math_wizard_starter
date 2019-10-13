import 'functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  TextEditingController answerController = new TextEditingController();
  var value = '';
  var input;
  var answer;

  @override
  Widget build(BuildContext context) {
    int r1 = randomNumber();
    int r2 = randomNumber();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 254, 218),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Quiz App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //SizedBox(),
          Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    '$r1 + $r2 = ',
                    style: TextStyle(
                      fontSize: 46,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.white,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      validator: (score) {
                        if (answerController.text.length == 0) {
                          return "Input Answer";
                        } else {
                          return null;
                        }
                      },
                      controller: answerController,
                      decoration: InputDecoration(
                        hintText: 'Answer',
                        focusColor: Colors.blue,
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),

                      onChanged: (int) {
                        value = answerController.text;
                      },

                      //hintText: 'Ans'),
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    input = int.parse(value);
                    print(input);
                    answer = r1 + r2;
                    if (input == answer){
                      score = score + 10;
                    } else{
                      score = score - 5;
                    }
                    r1 = randomNumber();
                    r2 = randomNumber();
                    answerController.clear();
                  });
                },
                textColor: Colors.white,
                color: Colors.green,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "CHECK",
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    r1 = randomNumber();
                    r2 = randomNumber();
                    answerController.clear();
                    score--;
                  });
                },
                textColor: Colors.white,
                color: Colors.blue,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "SKIP",
                ),
              )
            ],
          ),
          Text(
            'SCORE : $score',
            style: TextStyle(
              fontSize: 46,
              color: Colors.green,
            ),
          ),
        ],
      ),
      // SizedBox(),
    );
  }
}
