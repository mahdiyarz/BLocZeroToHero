import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_event.dart';
import '../bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.empty());
}
