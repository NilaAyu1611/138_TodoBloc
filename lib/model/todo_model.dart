class TodoModel {
  final String title;
  final DateTime date;
  final bool isCompleted;

  TodoModel({
    required this.title,      //wajib diisi
    required this.date,       //wajib diisi
    this.isCompleted = false,
  });
}
