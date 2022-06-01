import 'package:flutter_bloc/flutter_bloc.dart';

/// State to switch between login page and register page.
class LogSwitchCubit extends Cubit<bool> {
  /// Initiate state with value `true`.
  LogSwitchCubit() : super(true);

  /// Switch state value.
  void onTap() => emit(!state);
}
