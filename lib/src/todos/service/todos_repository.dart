import 'package:flutter_with_bloc/src/todos/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  String uri = "https://jsonplaceholder.typicode.com/todos";

  Future fetchTodos() async {
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return todosModelFromJson(response.body);
    } else {
      return Exception('Failed to fetch data');
    }
  }
}
