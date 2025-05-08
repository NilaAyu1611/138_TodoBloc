part of 'todo_bloc.dart';

sealed class TodoState {}

final class TodoLoading extends TodoState {}    //state unutk loading

final class TodoLoaded extends TodoState {
  final List<TodoModel> todos;    //daftar todo yang berhasil dimuat
  DateTime? selectedDate;

  TodoLoaded({
    required this.todos,
    required this.selectedDate,
  });
}
