import 'package:bloc/bloc.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/apis/login_api.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/apis/notes_api.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/bloc/actions.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/bloc/app_state.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/models.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(AppState.empty()) {
    on<LoginAction>((event, emit) async {
      //* start loading
      emit(
        const AppState(
          isLoading: true,
          loginErrors: null,
          loginHandle: null,
          fetchedNotes: null,
        ),
      );
      //* log the user in
      final loginHandle = await loginApi.login(
        email: event.email,
        password: event.password,
      );
      emit(
        AppState(
          isLoading: false,
          loginErrors: loginHandle == null ? LoginErrors.invalidHandle : null,
          loginHandle: loginHandle,
          fetchedNotes: null,
        ),
      );
    });
    on<LoadNoteAction>((event, emit) async {
      //* start loading
      emit(
        AppState(
          isLoading: true,
          loginErrors: null,
          loginHandle: state.loginHandle,
          fetchedNotes: null,
        ),
      );
      //* get the login handle
      final loginHandle = state.loginHandle;
      if (loginHandle != const LoginHandle.fooBar()) {
        //! invalid login handle, can not fetch notes
        emit(
          AppState(
            isLoading: false,
            loginErrors: LoginErrors.invalidHandle,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );
        return;
      }
      //* we have valid login handle and want to fetch notes
      final notes = await notesApi.getNotes(loginHandle: loginHandle!);
      emit(
        AppState(
          isLoading: false,
          loginErrors: null,
          loginHandle: loginHandle,
          fetchedNotes: notes,
        ),
      );
    });
  }
}
