


import 'package:bloc_demo/bloc/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/button_logic.dart';

import 'button_event.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {

  final  ButtonLogic buttonLogic;

  ButtonBloc({required this.buttonLogic}) : super(ButtonInitial()){

    on<ButtonClicked>((event, emit) {
      buttonLogic.handleButtonClick();

      emit(ButtonClickedState());
    });
  }
}