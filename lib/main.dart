import 'package:bloc_demo/bloc/button_state.dart';
import 'package:bloc_demo/domain/usecases/handle_button_click.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/button_logic.dart';

import 'bloc/button_bloc.dart';
import 'bloc/button_event.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ButtonBloc(
        handleButtonClick: HandleButtonClick(
          buttonLogic: ButtonLogic(), //creates an instance of the ButtonLogic class, not a function
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
                  if (state is ButtonClickedState) {
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
            ],
          ),
        ),
      ),
    );
  }
}
