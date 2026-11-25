import 'package:bloc_demo/domain/button_logic.dart';

class ResetCount {
  final ButtonLogic buttonLogic;

  ResetCount({required this.buttonLogic});

  int call(){
    return buttonLogic.resetCount();
  }
}