import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_todo_bloc/bloc/todo_bloc_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    final _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Todo List'),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Selected Date'),
                      BlocBuilder<TodoBlocBloc, TodoBlocState>(
                        builder: (context, state) {
                          if (state is TodoLoaded) {
                            if (state.selectedDate != null) {
                              return Text(
                                '${state.selectedDate!.day}/${state.selectedDate!.month}/${state.selectedDate!.year}',
                              );
                            }
                          }
                          return Text('No date selected');
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              context.read<TodoBlocBloc>().add(
                                TodoSelectedDate(date: selectedDate),
                              );
                            }
                          });
                        },
                        child: Text('Select Date'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
