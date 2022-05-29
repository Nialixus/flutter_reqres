import 'package:flutter_bloc/flutter_bloc.dart';

class LogSwitchCubit extends Cubit<bool> {
  LogSwitchCubit() : super(true);

  void onTap() => emit(!state);
}
