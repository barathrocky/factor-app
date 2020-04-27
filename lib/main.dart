import 'package:flutter/material.dart';
import 'dart:math';

int x, leftNumber, middleNumber, rightNumber, extra;
int i = 1, fact = 0, swap = 0;
var list = [];

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text('Factors Of a Number'),
          backgroundColor: Colors.blueAccent,
        ),
        body: DicePage(),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Do YouLike This :) ',
          child: Icon(Icons.thumb_up),
          backgroundColor: Colors.red,
          splashColor: Colors.white30,
          onPressed: () {},
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          Container(
            width: 300.0,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                labelText: 'Please enter an integer',
              ),
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(child: const Text('Thanks!')),
                      content:
                          Text('You typed "$value".Select the correct answer'),
                      actions: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            list.clear();
                            x = int.parse("$value");

                            for (i = 1; i <= x; i++) {
                              if (x % i == 0) {
                                fact++;
                                list.add(i);
                              }
                            }
                            list.removeLast();
                            list.remove(1);

                            final _random = new Random();
                            var element = list[_random.nextInt(list.length)];

                            print(fact);
                            print(list);
                            print(element);
                            leftNumber = Random().nextInt(x) + 2;
                            middleNumber = element;
                            rightNumber = Random().nextInt(x) + 2;
                            if (x % leftNumber == 0) {
                              leftNumber = Random().nextInt(x) + 2;
                            }
                            if (x % rightNumber == 0) {
                              rightNumber = Random().nextInt(x) + 2;
                            }
                            extra = Random().nextInt(3);
                            if (extra == 1) {
                              swap = leftNumber;
                              leftNumber = middleNumber;
                              middleNumber = rightNumber;
                              rightNumber = swap;
                            }
                            if (extra == 2) {
                              swap = middleNumber;
                              middleNumber = rightNumber;
                              rightNumber = leftNumber;
                              leftNumber = swap;
                            }
                            if (extra == 3) {
                              swap = rightNumber;
                              rightNumber = leftNumber;
                              leftNumber = middleNumber;
                              middleNumber = swap;
                            }
                            if (x % leftNumber == 0) {
                              extra = leftNumber;
                            }
                            if (x % middleNumber == 0) {
                              extra = middleNumber;
                            }
                            if (x % rightNumber == 0) {
                              extra = rightNumber;
                            }
                            list.insert(0, 1);
                            list.add(x);

                            setState(() {});
                          },
                          child: const Text('OK'),
                          color: Colors.blueAccent,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 175.0),
            child: Row(
              children: <Widget>[
                Spacer(),
                Expanded(
                  child: RaisedButton(
                    child: Text('$leftNumber'),
                    color: Colors.purpleAccent,
                    splashColor: Colors.white30,
                    textColor: Colors.white,
                    onPressed: () {
                      Ofa(context);
                      setState(
                        () {
                          print('Hello');
                          if ((x % leftNumber) == 0) {
                            print('Your Answer is right ');
                          }
                        },
                      );
                    },
                  ),
                ),
                Spacer(),
                Expanded(
                  child: RaisedButton(
                    child: Text('$middleNumber'),
                    color: Colors.purpleAccent,
                    splashColor: Colors.white30,
                    textColor: Colors.white,
                    onPressed: () {
                      Ofb(context);
                      setState(() {
                        print('Hello');
                        if ((x % middleNumber) == 0) {
                          print('Your Answer is right ');
                        }
                      });
                    },
                  ),
                ),
                Spacer(),
                Expanded(
                  child: RaisedButton(
                    child: Text('$rightNumber'),
                    color: Colors.purpleAccent,
                    splashColor: Colors.white30,
                    textColor: Colors.white,
                    onPressed: () {
                      Ofc(context);
                      setState(() {
                        print('Hello');
                        if ((x % rightNumber) == 0) {
                          print('Your Answer is right ');
                        }
                      });
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void Ofa(BuildContext context) {
  var alertDialog1 = AlertDialog(
    title: Center(child: const Text('Oops!')),
    content: Text(
        'You have selected the wrong Answer.\nThe correct answer is $extra.\n$x has $fact factors.\nThey are \n $list'),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
        color: Colors.blueAccent,
      ),
    ],
  );
  var alertDialog2 = AlertDialog(
    title: Center(child: const Text('Congratulations!')),
    content: Text('You have selected the right Answer.'),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
        color: Colors.blueAccent,
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext) {
        if (x % leftNumber != 0) {
          return alertDialog1;
        } else {
          return alertDialog2;
        }
      });
}

void Ofb(BuildContext context) {
  var alertDialog1 = AlertDialog(
    title: Center(child: const Text('Oops!')),
    content: Text(
        'You have selected the wrong Answer.\nThe correct answer is $extra.\n$x has $fact factors.\nThey are \n $list'),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
        color: Colors.blueAccent,
      ),
    ],
  );
  var alertDialog2 = AlertDialog(
    title: Center(child: const Text('Congratulations!')),
    content: Text('You have selected the right Answer.'),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
        color: Colors.blueAccent,
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext) {
        if (x % middleNumber != 0) {
          return alertDialog1;
        } else {
          return alertDialog2;
        }
      });
}

void Ofc(BuildContext context) {
  var alertDialog1 = AlertDialog(
    title: Center(child: const Text('Oops!')),
    content: Text(
        'You have selected the wrong Answer.\nThe correct answer is $extra.\n$x has $fact factors.\nThey are \n $list'),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
        color: Colors.blueAccent,
      ),
    ],
  );
  var alertDialog2 = AlertDialog(
    title: Center(child: const Text('Congratulations')),
    content: Text('You have selected the right Answer.'),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'),
        color: Colors.blueAccent,
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext) {
        if (x % rightNumber != 0) {
          return alertDialog1;
        } else {
          return alertDialog2;
        }
      });
}
