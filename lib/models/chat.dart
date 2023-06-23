import 'package:flutter/material.dart';

class chat {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  
  const chat({
    required this.id,
    this.title='',
    this.subtitle='',
    this.time='',
  });
}
