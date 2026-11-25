


import 'package:bloc_demo/bloc/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/usecases/handle_button_click.dart';


import 'button_event.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {

  final  HandleButtonClick handleButtonClick;

  ButtonBloc({required this.handleButtonClick}) : super(ButtonInitial()){

    on<ButtonClicked>((event, emit) {
      handleButtonClick();

      emit(ButtonClickedState());
    });
  }
}