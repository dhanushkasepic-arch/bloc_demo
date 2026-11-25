import 'package:bloc_demo/domain/button_logic.dart';

class IncrementCount {
  final ButtonLogic buttonLogic;

  IncrementCount({required this.buttonLogic});

  int call(){
    return buttonLogic.incrementCount();
  }
}