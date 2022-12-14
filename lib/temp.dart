/*
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
                ],
              ),
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



SizedBox(
                height: 800,
                width: 500,
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
                    CustomKey(text: '=', function: () => _result()),
                    CustomKey(text: '+', function: () => _operator('+')),
                  ],
                ),
              ),
 */