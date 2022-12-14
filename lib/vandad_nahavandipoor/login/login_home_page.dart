import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/bloc/actions.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/bloc/app_bloc.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/bloc/app_state.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/dialogs/generic_dialog.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/dialogs/loading_screen.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/models.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/strings.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/views/iterable_list_view.dart';
import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginHomePage extends StatelessWidget {
  const LoginHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homePage),
      ),
      // TODO: note this widget and exp
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, appState) {
          //* loading screen
          if (appState.isLoading) {
            LoadingScreen.instance().show(context: context, text: pleaseWait);
          } else {
            LoadingScreen.instance().hide();
          }

          //* display possible errors
          final loginError = appState.loginErrors;
          if (loginError != null) {
            showGenericDialog(
              context: context,
              title: loginErrorDialogTitle,
              content: loginErrorDialogContent,
              optionBuilder: () => {ok: true},
            );
          }

          //* if we are logged in, but we have no fetched notes, fetch them now
          if (appState.isLoading == false &&
              appState.loginErrors == null &&
              appState.loginHandle == const LoginHandle.fooBar() &&
              appState.fetchedNotes == null) {
            context.read<AppBloc>().add(const LoadNoteAction());
          }
        },
        builder: (context, appState) {
          final notes = appState.fetchedNotes;
          if (notes == null) {
            return LoginView(
              onLoginTapped: (email, password) {
                context.read<AppBloc>().add(
                      LoginAction(
                        email: email,
                        password: password,
                      ),
                    );
              },
            );
          } else {
            return notes.toListView();
          }
        },
      ),
    );
  }
}
