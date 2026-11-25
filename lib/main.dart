import 'package:bloc_demo/bloc/button_state.dart';
import 'package:bloc_demo/domain/usecases/handle_button_click.dart';
import 'package:bloc_demo/domain/usecases/reset_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/button_logic.dart';

import 'bloc/button_bloc.dart';
import 'bloc/button_event.dart';
import 'domain/usecases/decrement_count.dart';
import 'domain/usecases/increment_count.dart';

void main() {
  final buttonLogic = ButtonLogic();
  runApp(

    BlocProvider(
      create: (context) => ButtonBloc(
        handleButtonClick: HandleButtonClick(
          buttonLogic: buttonLogic,
        ),
        incrementCount: IncrementCount(
          buttonLogic: buttonLogic,
        ),
        decrementCount: DecrementCount(
          buttonLogic: buttonLogic
        ),
        resetCount: ResetCount(
            buttonLogic: buttonLogic
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyApp building');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          shadowColor: Colors.lightBlueAccent,
          centerTitle: true,
          title: const Text('Flutter Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ButtonBloc, ButtonState>(
                builder: (context, state) {
                  print(state);
                  if (state.isButtonClicked) {
                    return const Text('Button Clicked!');
                  }
                  return const Text('Hello');
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  context.read<ButtonBloc>().add(ButtonClicked());
                },
                child: const Text('Click me'),
              ),

              const SizedBox(height: 20),

              BlocBuilder<ButtonBloc, ButtonState>(
                builder: (context,state){
                  return Text('Count: ${state.count}');
                },
              ),

              const SizedBox(height: 20,),


              ElevatedButton(
                  onPressed:() {
                    context.read<ButtonBloc>().add(
                        IncrementButtonClicked(),
                    );
                  }, child: const Text('+')),

              const SizedBox(height: 20,),

              ElevatedButton(
                  onPressed:() {
                    context.read<ButtonBloc>().add(
                      DecrementButtonClicked(),
                    );
                  }, child: const Text('-')),


              const SizedBox(height: 20,),

              ElevatedButton(
                  onPressed:() {
                    context.read<ButtonBloc>().add(
                      ResetButtonClicked(),
                    );
                  }, child: const Text('Reset'))



            ],
          ),
        ),
      ),
    );
  }
}
