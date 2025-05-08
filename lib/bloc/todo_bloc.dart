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
    
  }
}
