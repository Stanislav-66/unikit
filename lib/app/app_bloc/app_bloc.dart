import 'package:bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppLoading()) {
    on<AppStarted>((event, emit) async {
      await Future.delayed(const Duration(seconds: 8));
      emit(AppLoaded());
    });
  }
}
