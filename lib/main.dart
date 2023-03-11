import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivian_app/src/core/injections_dependencies/injections_dependencies.dart';
import 'package:trivian_app/src/features/trivian/presentation/bloc/trivian_bloc.dart';

import 'src/app.dart';

void main() {
  setup();
  runApp(BlocProvider(
    create: (context) => getIt<TrivianBloc>(),
    child: const MyApp(),
  ));
}
