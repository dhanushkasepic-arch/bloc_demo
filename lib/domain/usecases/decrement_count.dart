import 'package:bloc_demo/domain/button_logic.dart';

class DecrementCount {
  final ButtonLogic buttonLogic;

  DecrementCount({required this.buttonLogic});

  int call(){
    return buttonLogic.decrementCount();
  }
}