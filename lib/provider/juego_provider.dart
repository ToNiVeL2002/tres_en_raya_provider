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

  get boxState => _boxStates;

  get positionMap => _positionMap;

  get playerTurn => _playerTurn;

  void changeState( String boxId ) {
    _boxStates[boxId] = false;

    notifyListeners();
  } 

  void changePositionMap( String boxId ) {
    print('---------------${_boxStates[boxId]}');
    if(_boxStates[boxId] == true) {
      _playerTurn = !_playerTurn;
      _positionMap[boxId] = _playerTurn;
      notifyListeners();
    }
  }

  void resetStates() {
    _boxStates.forEach((key, value) {
      _boxStates[key] = true;
    });

    _positionMap.forEach((key, value) {
      _positionMap[key] = true;
    },);
    
    notifyListeners();
  }

  // void changePlayerTurn() {
  //   _playerTurn = !_playerTurn;

  //   notifyListeners();
  // }

  


}