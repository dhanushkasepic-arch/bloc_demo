


import 'package:bloc_demo/bloc/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/usecases/handle_button_click.dart';


import '../domain/usecases/increment_count.dart';
import '../domain/usecases/decrement_count.dart';
import '../domain/usecases/reset_count.dart';
import 'button_event.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {

  final  HandleButtonClick handleButtonClick;
  final IncrementCount incrementCount;
  final DecrementCount decrementCount;
  final ResetCount resetCount;

  ButtonBloc({required this.handleButtonClick, required this.incrementCount, required this.decrementCount, required this.resetCount})
      : super( ButtonState()){

    on<ButtonClicked>((event, emit) {
      handleButtonClick.call();

      emit(state.copyWith(isButtonClicked: true));
    });

    on<IncrementButtonClicked>((event, emit){
      final updatedCount= incrementCount.call();
      emit(state.copyWith(count: updatedCount));
    });

    on<DecrementButtonClicked>((event, emit){
      final updatedCount= decrementCount.call();
      emit(state.copyWith(count: updatedCount));

    });



    on<ResetButtonClicked>((event, emit){
      final updatedCount= resetCount.call();
      emit(state.copyWith(count: updatedCount));
    });
  }
}