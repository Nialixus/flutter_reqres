part of '../login.dart';

class LoginRequest extends Cubit<WriteStates> {
  LoginRequest([super.state = const WriteIdleState()]);

  final TextAreaController email = TextAreaController();
  final TextAreaController password = TextAreaController(obscure: true);

  Future<void> run() async {
    emit(const WriteLoadingState());
    Dio http = Dio();

    try {
      if (email.text.isEmpty) {
        emit(WriteFailedState<FocusNode>(
          message: 'Email is empty',
          data: email.focusNode,
        ));
      } else if (!email.text.isEmail) {
        emit(WriteFailedState<FocusNode>(
          message: 'Email is not valid',
          data: email.focusNode,
        ));
      } else if (password.text.isEmpty) {
        emit(WriteFailedState<FocusNode>(
          message: 'Password is empty',
          data: password.focusNode,
        ));
      } else {
        // Mock Delay
        await Future.delayed(Shared.value.delay);

        Response response = await http.post(
          '${Shared.value.baseURL}/login',
          data: {
            'email': email.text,
            'password': password.text,
          },
        );

        LoginData data = LoginData.fromJSON(response.data);
        SharedResponse store = await Login.store.update(
          data.toJSON,
          force: true,
        );

        emit(WriteSuccessState(
          message: store.message,
          data: data,
        ));
      }
    } on DioException catch (e) {
      emit(WriteErrorState(message: e.message ?? '$e', data: e.stackTrace));
    } catch (e, s) {
      emit(WriteErrorState(message: '$e', data: s));
    } finally {
      http.close();
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
