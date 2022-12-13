import 'package:flutter/material.dart';
//import 'style.dart';

void main() {
  runApp(const MyApp());
}

/*
  TO DO list:
  
  PHASE 1:
  > Change the vars _display  / _displayHistory to double, AND
    only convert them to String when they have to de displayed (try toInt())
  > Implement a WrapAround mode for the display in order to increase the size of
      digits on display when needed.
  > Add thousand separator e.g. 1,000,000.00
  > Create a Scientific Notation function in order to display big numbers.
  > Implement a way for history to display the full equation

  PHASE 2:
  > Create a new view.
  > Implement a basic math equation solver screen

  PHASE 3:
  > Create a new view.
  > Implement a more complex calculator.
  > Percentages and interest converter (juros aa -> am -> ad / ad -> am -> aa)

  PHASE 4:
  > Create a new view.
  > Allow the user to customize the app:
    > Build two sliders:
      > Slider 1: primatySwatch color
      > Slider 2: brightness level
    > Identify based on brightness level if the theme is light or dark

*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool _darkMode = true;

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);
ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

class _MyAppState extends State<MyApp> {

  String _display = '0';
  String _displayHistory = '0';
  String _displayOperator = ' ';

  void _incrementCounter() {
    setState(() {
      _display = '${double.parse(_display) + 1}';
    });
  }

  void _decrementCounter() {
    setState(() {
      _display = '${double.parse(_display) - 1}';
    });
  }

  void _clearDisplay() {
    setState(() {
      _display = '0';
    });
  }

  void _clearEverything() {
    setState(() {
      _displayHistory = '0';
      _displayOperator = ' ';
      _clearDisplay();
    });
  }

  void _clearHistory() {
    setState(() {
      _displayHistory = '0';
      _displayOperator = ' ';
    });
  }

  void _updateDisplay(String s) {
    _displayOperator == '='? _clearEverything():null;
    setState(() {
      if(_display == '0'){
        _display = s;
      }else if (_display.length < 11){
        _display += s;
      }
    });
  }

  void _del() {
    setState(() {
      if (_display != '0') {
        _display = _display.substring(0, _display.length - 1);
        _display == '' ? _display = '0' : null;
      }
    });
  }

  void _switchTheme() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }

  void _percent(){

    if(_displayOperator == '+' || _displayOperator == '-'){
      setState(() {
          _display = (double.parse(_displayHistory) * (double.parse(_display) / 100)).toString();
      });
    }else if(_displayOperator == 'x' || _displayOperator == '/'){
      setState(() {
        _display = (double.parse(_display) / 100).toString();
      });
    }
  }

  void _operator(String op){
    setState(() {
      if(_displayHistory == ' '){
        _displayHistory = _display;
      }else{
        _result();
        _displayHistory = _display;
      }
      _displayOperator = op;
      _clearDisplay();
    });
  }

  void _result(){
    setState(() {
      switch (_displayOperator) {
        case '+':
          _display = (double.parse(_displayHistory) + double.parse(_display)).toString();
          break;
        case '-':
          _display = (double.parse(_displayHistory) - double.parse(_display)).toString();
          break;
        case 'x':
          _display = (double.parse(_displayHistory) * double.parse(_display)).toString();
          break;
        case '/':
          _display = (double.parse(_displayHistory) / double.parse(_display)).toString();
          break;
      }
      _clearHistory();
      _displayOperator = '=';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _darkMode ? _darkTheme : _lightTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Basic Calculator'),
            actions: [
              Switch(
                activeColor: Colors.blueAccent,
                value: _darkMode,
                onChanged: (bool state) => _switchTheme(),
              ),
              PopupMenuButton(
                  icon: const Icon(Icons.menu),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(_darkMode?'Light Theme':'Dark Theme'),
                          onTap: () => _switchTheme(),
                        ),
                        const PopupMenuItem(child: Text('Criado por Lucas Moraes'))
                      ])
            ],
          ),
          body: Center(
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SizedBox(
                    height: 25,
                    width: 200,
                    child: Text(
                      _displayHistory,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 20,
                    child: Text(
                      _displayOperator,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),

                ],),
                SizedBox(
                  height: 40,
                  width: 220,
                  child: Text(
                    _display,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _percent(),
                      child: const Icon(Icons.percent),
                    ),
                    ElevatedButton(
                      onPressed: _clearEverything,
                      child: const Text('CE'),
                    ),
                    ElevatedButton(
                      onPressed: _clearDisplay,
                      child: const Text('C'),
                    ),
                    ElevatedButton(
                      onPressed: () =>_del(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _updateDisplay('7'),
                      child: const Text('7'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateDisplay('8'),
                      child: const Text('8'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateDisplay('9'),
                      child: const Text('9'),
                    ),
                    ElevatedButton(
                      onPressed: () =>_operator('/'),
                      child: const Text('/'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _updateDisplay('4'),
                      child: const Text('4'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateDisplay('5'),
                      child: const Text('5'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateDisplay('6'),
                      child: const Text('6'),
                    ),
                    ElevatedButton(
                      onPressed: () =>_operator('x'),
                      child: const Text('X'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _updateDisplay('1'),
                      child: const Text('1'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateDisplay('2'),
                      child: const Text('2'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateDisplay('3'),
                      child: const Text('3'),
                    ),
                    ElevatedButton(
                      onPressed: () => _operator('-'),
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _updateDisplay('.'),
                      child: const Text('.'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateDisplay('0'),
                      child: const Text('0'),
                    ),
                    ElevatedButton(
                      onPressed: () => _result(),
                      child: const Text('='),
                    ),
                    ElevatedButton(
                      onPressed: () => _operator('+'),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text("+ +"),
                ),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text("- -"),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
