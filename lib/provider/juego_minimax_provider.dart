import 'package:flutter/material.dart';
import 'dart:math';

class JuegoMiniMaxProvider extends ChangeNotifier {

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

  void changePositionMap(String boxId) {
    if (_boxStates[boxId] == true && !_winner) {
      _positionMap[boxId] = _playerTurn;
      changeState(boxId); 
      fineTheWinner(); 
      _playerTurn = !_playerTurn;
      if (!_winner && !_playerTurn) {
        
        makeAIMove(); 
      }
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


  // Función minimax
  int minimax(List<List<String>> board, bool isMaximizing) {
    // Verificar el estado del juego
    
    fineTheWinner();
    if (_resultado != '') {
      if (_resultado == 'Ganó x') {
        return 10; // Valor alto para maximizar si gana la máquina
      } else if (_resultado == 'Ganó o') {
        return -10; // Valor bajo para minimizar si gana el jugador
      } else {
        return 0; // Empate
      }
    }

    // Si es el turno de la máquina (maximizar)
    if (isMaximizing) {
      int bestScore = -100000;
      // Recorrer todo el tablero
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          // Verificar si la celda está vacía
          if (board[i][j] == '') {
            // Realizar el movimiento
            board[i][j] = 'o';
            // Calcular la puntuación para este movimiento
            int score = minimax(board, false);
            // Deshacer el movimiento
            board[i][j] = '';
            // Actualizar la mejor puntuación
            bestScore = max(score, bestScore);
          }
        }
      }
      return bestScore;
    } else {
      // Si es el turno del jugador (minimizar)
      int bestScore = 100000;
      // Recorrer todo el tablero
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          // Verificar si la celda está vacía
          if (board[i][j] == '') {
            // Realizar el movimiento
            board[i][j] = 'x';
            // Calcular la puntuación para este movimiento
            int score = minimax(board, true);
            // Deshacer el movimiento
            board[i][j] = '';
            // Actualizar la mejor puntuación
            bestScore = min(score, bestScore);
          }
        }
      }
      return bestScore;
    }
  }


  // Función para encontrar el mejor movimiento usando minimax
  List<int> findBestMove() {
    int bestScore = -1000;
    List<int> bestMove = [-1, -1];
    // Recorrer todo el tablero
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        // Verificar si la celda está vacía
        if (_matriz[i][j] == '') {
          // Realizar el movimiento
          _matriz[i][j] = 'o';
          // Calcular la puntuación para este movimiento
          int score = minimax(_matriz, false);
          // Deshacer el movimiento
          _matriz[i][j] = '';
          // Actualizar el mejor movimiento si es necesario
          if (score > bestScore) {
            bestScore = score;
            bestMove = [i, j];
          }
        }
      }
    }
    return bestMove;
  }


  void makeAIMove() {
    if (!winner && !_playerTurn) { // Verificar que no haya un ganador y que sea el turno de la IA
      List<int> bestMove = findBestMove(); // Calcular el mejor movimiento usando Minimax
      int row = bestMove[0];
      int col = bestMove[1];
      String boxId = 'box${row * 3 + col + 1}'; // Calcular el ID de la casilla correspondiente al movimiento
      changeState(boxId); // Cambiar el estado de la casilla
      // Actualizar el mapa de posiciones con el símbolo correspondiente
      _positionMap[boxId] = false; 

      // Cambiar el turno del jugador después de que ambos hayan hecho su movimiento
      _playerTurn = !_playerTurn;
      notifyListeners();
    }
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