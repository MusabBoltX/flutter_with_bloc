import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc/src/screens/components/bolt_card.dart';
import 'package:flutter_with_bloc/src/todos/todos/todos_bloc.dart';
import 'package:flutter_with_bloc/src/todos/todos/todos_event.dart';
import 'package:flutter_with_bloc/src/todos/todos/todos_state.dart';

class MyTodos extends StatefulWidget {
  const MyTodos({Key? key}) : super(key: key);

  @override
  State<MyTodos> createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> {
  TodosBloc? todosBloc;

  @override
  void initState() {
    todosBloc = BlocProvider.of<TodosBloc>(context);
    todosBloc?.add(FetchTodosEvent());
    super.initState();
  }

  @override
  void dispose() {
    todosBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Todos"),
        actions: [
          IconButton(
            onPressed: () {
              todosBloc?.add(FetchTodosEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<TodosBloc, TodoStates>(
        builder: (context, state) {
          if (state is TodoInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoLoadedState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return BoltsCard(
                  title: state.data[index].title.toString(),
                  completed: state.data[index].completed ?? false,
                  image:
                      "https://yt3.googleusercontent.com/rPTMAygaSNkMnSRNRscSk8LYA_d_lUSUbVnswtDjYpzz_Xf7WXXvCL4G7eDmgclQqcIJRwwBAw4=s900-c-k-c0x00ffffff-no-rj",
                );
              },
            );
          }
          if (state is TodoErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
