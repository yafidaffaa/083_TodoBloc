import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_todo_bloc/bloc/todo_bloc_bloc.dart';
import 'package:state_todo_bloc/presentation/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBlocBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App todo list PAML',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const TodoPage(),
      ),
    );
  }
}
