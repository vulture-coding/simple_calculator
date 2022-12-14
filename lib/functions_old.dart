/*
Old functions from _MyAppState (main.dart):

String _display = '0';
  String _displayHistory = '0';
  String _displayOperator = ' ';

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
    _displayOperator == '=' ? _clearEverything() : null;
    setState(() {
      if (_display == '0') {
        _display = s;
      } else if (_display.length < 11) {
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
      darkMode = !darkMode;
    });
  }

  void _percent() {
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
  }

  void _operator(String op) {
    setState(() {
      if (_displayHistory == ' ') {
        _displayHistory = _display;
      } else {
        _result();
        _displayHistory = _display;
      }
      _displayOperator = op;
      _clearDisplay();
    });
  }

  void _result() {
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
      }
      _clearHistory();
      _displayOperator = '=';
    });
  }

 */