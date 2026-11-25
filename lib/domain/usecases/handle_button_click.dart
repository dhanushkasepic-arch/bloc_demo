

import 'package:bloc_demo/domain/button_logic.dart';

class HandleButtonClick {
  final ButtonLogic buttonLogic;
  HandleButtonClick({required this.buttonLogic});



  void call(){
    buttonLogic.processClick();
    print(call);
  }
}