


import 'package:bloc_demo/bloc/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_event.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial()){

    on<ButtonClicked>((event,emit){
      print(event);
      emit(ButtonClickedState());
    });
  }
}