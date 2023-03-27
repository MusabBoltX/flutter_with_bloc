import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc/src/todos/service/todos_repository.dart';

import 'todos_event.dart';
import 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodoStates> {
  TodosBloc() : super(TodoInitialState()) {
    on<FetchTodosEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        await TodoRepository().fetchTodos().then((value) {
          emit(TodoLoadedState(data: value));
        });
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });
  }
}