import 'package:dark_switch/keyboard.dart';
import 'package:flutter/material.dart';
import 'style.dart';

void main() {
  runApp(const MyApp());
}

/*
  TOsDO list:
  
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

/*
 Teste de alteração p atualizar no GIT

 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool darkMode = true;

class _MyAppState extends State<MyApp> {
  String _display = '0';
  String _displayHistory = '0';
  String _displayOperator = ' ';
  String _historyMem = '0';
  String _lastKeyPressed = '';

  void _clearDisplay() {
    setState(() {
      _display = '0';
    });
  }

  void _clearHistoryMem() {
    setState(() {
      _historyMem = '0';
    });
  }

  void _clearEverything() {
    setState(() {
      _displayHistory = '0';
      _displayOperator = ' ';
      _lastKeyPressed = '';
      _clearHistoryMem();
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
    _lastKeyPressed += s;
    _displayOperator == '=' ? _clearEverything() : null;
    setState(() {
      if (_display == '0') {
        _display = s;
      } else if (_display.length < 11) {
        _display += s;
      }
      _historyMem == '0' ? _historyMem = s : _historyMem += s;
    });
  }

  void _del() {
    _lastKeyPressed += '<';

    _displayOperator == '=' ? _clearEverything() : null;

    setState(() {
      if (_display != '0') {
        _display = _display.substring(0, _display.length - 1);
        _display == '' ? _display = '0' : null;
      }
      if (_historyMem != '0') {
        _historyMem = _historyMem.substring(0, _historyMem.length - 1);
        _historyMem == '' ? _historyMem = '0' : null;
      }
    });
  }

  void _percent() {
    _lastKeyPressed += '%';

    _historyMem = _historyMem.substring(0, _historyMem.lastIndexOf(_display));

    if (_displayOperator == '+' || _displayOperator == '-') {
      setState(() {
        _display =
            (double.parse(_displayHistory) * (double.parse(_display) / 100))
                .toString();
      });
    } else if (_displayOperator == 'x' || _displayOperator == '/') {
      setState(() {
        _display = (double.parse(_display) / 100).toString();
      });
    }

    _historyMem += _display;
  }

  void _reverseSign() {
    _lastKeyPressed += '!';
    _historyMem = _historyMem.substring(0, _historyMem.lastIndexOf(_display));

    _display = "${-double.parse(_display)}";

    _historyMem += _display;
  }

  void _operator(String op) {
    setState(() {
      if ('x/'.contains(op) &
          !_historyMem.contains('x') &
          !_historyMem.contains('/') &
          (_historyMem.contains('+') || _historyMem.contains('-'))) {
        _historyMem = '(${_historyMem.substring(0, _historyMem.length)})';
      }

      if (_isOperator(_historyMem[_historyMem.length - 1])) {
        _historyMem = _historyMem.substring(0, _historyMem.length - 1);
        _historyMem += op;
      } else if (_displayHistory == ' ') {
        _displayHistory = _display;
      } else {
        _result();
        _displayHistory = _display;
      }
      _lastKeyPressed += op;
      _displayOperator = op;

      if (!_historyMem.endsWith(op)) {
        _historyMem += op;
      }
      _clearDisplay();
    });
  }

  bool _isOperator(String op) => '+-x/'.contains(op);

  bool _isNum(String n) => '0123456789'.contains(n);

  void _result({bool? manualClick}) {
    setState(() {
      switch (_displayOperator) {
        case '+':
          _display = (double.parse(_displayHistory) + double.parse(_display))
              .toString();
          break;
        case '-':
          _display = (double.parse(_displayHistory) - double.parse(_display))
              .toString();
          break;
        case 'x':
          _display = (double.parse(_displayHistory) * double.parse(_display))
              .toString();
          break;
        case '/':
          _display = (double.parse(_displayHistory) / double.parse(_display))
              .toString();
          break;
        case '=':
          _historyMem = _display;
          _displayHistory = _display;
          break;
      }
      _clearHistory();
      _displayOperator = '=';

      if (manualClick ?? false) {
        _historyMem += '=';
        _lastKeyPressed += '=';
      }
    });
  }

  void _switchTheme() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode ? darkTheme() : lightTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Calculator'),
          actions: [
            Switch(
              activeColor: Colors.blueAccent,
              value: darkMode,
              onChanged: (bool state) => _switchTheme(),
            ),
            PopupMenuButton(
                icon: const Icon(Icons.menu),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text(darkMode ? 'Light Theme' : 'Dark Theme'),
                        onTap: () => _switchTheme(),
                      ),
                      const PopupMenuItem(
                          child: Text('Criado por Lucas Moraes'))
                    ])
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FittedBox(
                  child: Text(_historyMem),
                ),
              ),
              Expanded(flex: 2, child: FittedBox(child: Text(_display))),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: [
                      CustomKey(text: '%', function: _percent),
                      CustomKey(text: 'CE', function: _clearEverything),
                      CustomKey(text: 'C', function: _clearDisplay),
                      CustomKey(text: '<', function: _del),
                      CustomKey(text: '7', function: () => _updateDisplay('7')),
                      CustomKey(text: '8', function: () => _updateDisplay('8')),
                      CustomKey(text: '9', function: () => _updateDisplay('9')),
                      CustomKey(text: '/', function: () => _operator('/')),
                      CustomKey(text: '4', function: () => _updateDisplay('4')),
                      CustomKey(text: '5', function: () => _updateDisplay('5')),
                      CustomKey(text: '6', function: () => _updateDisplay('6')),
                      CustomKey(text: 'X', function: () => _operator('x')),
                      CustomKey(text: '1', function: () => _updateDisplay('1')),
                      CustomKey(text: '2', function: () => _updateDisplay('2')),
                      CustomKey(text: '3', function: () => _updateDisplay('3')),
                      CustomKey(text: '-', function: () => _operator('-')),
                      CustomKey(text: '.', function: () => _updateDisplay('.')),
                      CustomKey(text: '0', function: () => _updateDisplay('0')),
                      CustomKey(text: '=', function: () => _result(manualClick: true),isOperator: true),
                      CustomKey(text: '+', function: () => _operator('+')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
