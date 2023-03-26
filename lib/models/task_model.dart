// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String body;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;
  TaskModel({
    required this.title,
    required this.body,
    required this.id,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  TaskModel copyWith(
      {String? title,
      String? body,
      String? id,
      String? date,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return TaskModel(
      title: title ?? this.title,
      body: body ?? this.body,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      body: map['body'] as String,
      id: map['id'] as String,
      date: map['date'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
    );
  }

  @override
  List<Object?> get props =>
      [title, body, id, date, isDone, isDeleted, isFavorite];
}
