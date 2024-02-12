import 'package:flutter/material.dart';

class JuegoProvider extends ChangeNotifier {

  final Map<String, bool> _boxStates = {
    'box1' : true,
    'box2' : true,
    'box3' : true,
    'box4' : true,
    'box5' : true,
    'box6' : true,
    'box7' : true,
    'box8' : true,
    'box9' : true,
  };

  final Map<String, bool> _positionMap= {
    'box1' : true,
    'box2' : true,
    'box3' : true,
    'box4' : true,
    'box5' : true,
    'box6' : true,
    'box7' : true,
    'box8' : true,
    'box9' : true,
  };

  bool _playerTurn = true;

  final List<List<String>> _matriz = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];
  
  String _resultado = '';

  bool _winner = false;

  get boxState => _boxStates;

  get positionMap => _positionMap;

  get playerTurn => _playerTurn;

  get resultado => _resultado;

  get winner => _winner;

  void changeState( String boxId ) {
    _boxStates[boxId] = false;

    notifyListeners();
  } 

  void changePositionMap( String boxId ) {
    if(_boxStates[boxId] == true) {
      _positionMap[boxId] = _playerTurn;
      _playerTurn = !_playerTurn;
      notifyListeners();
    }
  }

  void fineTheWinner() {
    
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        String boxKey = 'box${i * 3 + j + 1}';
        if (_boxStates[boxKey] == false) {
          _matriz[i][j] = positionMap[boxKey] ? 'x' : 'o'; 
        } else {
          _matriz[i][j] = ''; 
        }
      }
    }

    String horizontal = buscarHorizontal(_matriz);
    String vertical = buscarVertical(_matriz);
    String diagonal = buscarDiagonal(_matriz);
    String empate = verificarEmpate(_matriz);

    if (horizontal.isNotEmpty) {
      _resultado = horizontal;
    } else if (vertical.isNotEmpty) {
      _resultado = vertical;
    } else if (diagonal.isNotEmpty) {
      _resultado = diagonal;
    } else if (empate.isNotEmpty) {
      _resultado = empate;
    } else {
      _resultado = 'Nadie ganó';
    }

  }

  String buscarHorizontal(List<List<String>> m) {
    for (int i = 0; i < 3; i++) {
      if (m[i][0] == m[i][1] && m[i][1] == m[i][2]) {
        if (m[i][0] == 'x') {
          isWinner=true;
          return 'Ganó x';
        } else if (m[i][0] == 'o') {
          isWinner=true;
          return 'Ganó o';
        }
      }
    }
    return '';
  }

  String buscarVertical(List<List<String>> m) {
    for (int j = 0; j < 3; j++) {
      if (m[0][j] == m[1][j] && m[1][j] == m[2][j]) {
        if (m[0][j] == 'x') {
          isWinner=true;
          return 'Ganó x';
        } else if (m[0][j] == 'o') {
          isWinner=true;
          return 'Ganó o';
        }
      }
    }
    return '';
  }

  String buscarDiagonal(List<List<String>> m) {
    if ((m[0][0] == m[1][1] && m[1][1] == m[2][2]) ||
        (m[0][2] == m[1][1] && m[1][1] == m[2][0])) {
      if (m[1][1] == 'x') {
        isWinner=true;
        return 'Ganó x';
      } else if (m[1][1] == 'o') {
        isWinner=true;
        return 'Ganó o';
      }
    }
    return '';
  }

  String verificarEmpate(List<List<String>> m) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (m[i][j] == '') {
          return '';
        }
      }
    }
    isWinner = true;
    return 'Empate';
  }

  void resetStates() {
    _playerTurn = true;

    _boxStates.forEach((key, value) {
      _boxStates[key] = true;
    });

    _positionMap.forEach((key, value) {
      _positionMap[key] = true;
    },);

    notifyListeners();
  }

  set isWinner(bool value) {
    _winner = value;

    notifyListeners();
  }

}