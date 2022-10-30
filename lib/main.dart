import 'package:flutter/material.dart';
import '../bloc/bloc_imports.dart';
import 'package:path_provider/path_provider.dart';

import '../app/app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
    blocObserver: MyBlocObserver(),
  );

  // Bloc.observer = MyBlocObserver();
}
