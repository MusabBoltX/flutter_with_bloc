import 'package:equatable/equatable.dart';

abstract class TodosEvent extends Equatable {}

class FetchTodosEvent extends TodosEvent {
  @override
  List<Object> get props => [];
}
