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

import 'package:bloc_zero_to_hero/vandad_nahavandipoor/show_pics/views/show_pics_home.dart';
import 'package:flutter/material.dart';
// import '../vandad_nahavandipoor/cubit_home_page.dart';
// import 'vandad_nahavandipoor/persons/bloc_home_page.dart';
// import 'vandad_nahavandipoor/persons/bloc/persons_bloc.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //? login project
      // home: BlocProvider(
      //   create: (_) => AppBloc(
      //     loginApi: LoginApi(),
      //     notesApi: NotesApi(),
      //     acceptableLoginHandle: const LoginHandle.fooBar(),
      //   ),
      //   child: LoginHomePage(),
      // ),

      //? show pic project
      title: 'Show pics',
      home: const ShowPicsHome(),
    );
  }
}
