import 'package:flutter/material.dart';

import '../bloc/bloc_imports.dart';
import '../home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
