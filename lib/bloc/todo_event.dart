part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class TodoEventLoad extends TodoEvent {}

final class TodoSelectDate extends TodoEvent {      //event untuk memilih tanggal
  final DateTime date;
  TodoSelectDate({required this.date});
}

final class TodoEventAdd extends TodoEvent {
  final String title;
  final DateTime date;
  TodoEventAdd({required this.title, required this.date});
}

final class TodoEventComplete extends TodoEvent {
  final int index;
  TodoEventComplete({required this.index});
}
