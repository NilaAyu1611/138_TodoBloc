part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class TodoEventLoad extends TodoEvent {}

final class TodoSelectDate extends TodoEvent {      //event untuk memilih tanggal
  final DateTime date;
  TodoSelectDate({required this.date});
}