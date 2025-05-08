import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:praktodobloc/model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading()) {
    on<TodoEventLoad>((event, emit) {                 //ketika eventload tersebut dipicu
      emit(TodoLoaded(todos: [], selectedDate: null));    //bloc akan mengubah state -> todoloaded dengan daftar kosong & tanpa tanggal yang dipilh
    });

    on<TodoSelectDate>((event, emit) {
      final currentState = state;
      if (currentState is TodoLoaded) {
        emit(TodoLoaded(todos: currentState.todos, selectedDate: event.date));    //memilih tanggal
      }
    });
    
    on<TodoEventAdd>((event, emit) {
      final currentState = state;
      if (currentState is TodoLoaded) {
        final updatedTodos = List<TodoModel>.from(currentState.todos)     //addtodo baru maka akan masuk ke list
          ..add(TodoModel(title: event.title, date: event.date));
        emit(TodoLoaded(todos: updatedTodos, selectedDate: null));
      }
    });

    on<TodoEventComplete>((event, emit) {
      final currentState = state;
      if (currentState is TodoLoaded) {
        final updatedTodos = List<TodoModel>.from(currentState.todos);
        final todo = updatedTodos[event.index];         //memperbarui todo
        updatedTodos[event.index] = TodoModel(
          title: todo.title,
          date: todo.date,
          isCompleted: !todo.isCompleted,         //adanya status
        );
        emit(TodoLoaded(todos: updatedTodos, selectedDate: currentState.selectedDate));
      }
    });
  }
}
