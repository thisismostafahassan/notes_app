import 'package:flutter/material.dart';

class Note {
  final String title;
  final String descreption;
  final DateTime date;
  final Color color;
  final int id;

  Note({
    required this.title,
    required this.descreption,
    required this.date,
    required this.color,
    required this.id,
  });
}
