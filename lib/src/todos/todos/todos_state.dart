// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_with_bloc/src/todos/models/todo_model.dart';

abstract class TodoStates extends Equatable {}

class TodoInitialState extends TodoStates {
  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoStates {
  @override
  List<Object> get props => [];
}

class TodoLoadedState extends TodoStates {
  List<TodosModel> data = [];

  TodoLoadedState({required this.data});
  @override
  List<Object> get props => data;
}

class TodoErrorState extends TodoStates {
  final String message;
  TodoErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
