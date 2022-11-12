//* aj_flutter Course

// import 'package:flutter/material.dart';

// import 'package:path_provider/path_provider.dart';

// import 'aj_flutter/app/app.dart';
// import 'aj_flutter/bloc/bloc_imports.dart';

// void main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final storage = await HydratedStorage.build(
//       storageDirectory: await getApplicationDocumentsDirectory());

//   HydratedBlocOverrides.runZoned(
//     () => runApp(const MyApp()),
//     storage: storage,
//     blocObserver: MyBlocObserver(),
//   );

//   // Bloc.observer = MyBlocObserver();
// }

//* vandad_nahavandipoor Course

import 'package:flutter/material.dart';
import 'vandad_nahavandipoor/cubit_home_page.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CubitHomePage(),
    );
  }
}
