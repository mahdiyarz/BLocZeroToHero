import 'package:bloc_zero_to_hero/vandad_nahavandipoor/show_pics/bloc/bottom_bloc.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/show_pics/bloc/top_bloc.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/show_pics/models.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/show_pics/views/app_bloc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowPicsHome extends StatelessWidget {
  const ShowPicsHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TopBloc>(
              create: (_) => TopBloc(
                waitBeforeLoading: const Duration(seconds: 3),
                urls: images,
              ),
            ),
            BlocProvider<BottomBloc>(
              create: (_) => BottomBloc(
                waitBeforeLoading: const Duration(seconds: 3),
                urls: images,
              ),
            ),
          ],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppBlocView<TopBloc>(),
              AppBlocView<BottomBloc>(),
            ],
          ),
        ),
      ),
    );
  }
}
