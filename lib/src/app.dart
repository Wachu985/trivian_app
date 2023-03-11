import 'package:flutter/material.dart';
import 'package:trivian_app/src/features/trivian/presentation/views/trivian_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trivian',
        home: TrivianView());
  }
}
