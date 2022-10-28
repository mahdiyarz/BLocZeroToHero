import 'package:flutter/material.dart';
import '../bloc/bloc_imports.dart';

import '../app/app.dart';

void main(List<String> args) {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
