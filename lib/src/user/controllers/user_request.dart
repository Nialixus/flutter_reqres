part of '../user.dart';

class UserRequest extends Cubit<ReadStates> {
  UserRequest({required this.id}) : super(const ReadLoadingState()) {
    run();
  }

  final int id;

  Future<void> run() async {
    emit(const ReadLoadingState());
    Dio http = Dio();

    try {
      SharedResponse session = await Login.session.read();

      if (session.one == null) {
        emit(ReadErrorState<SharedResponse>(
          message: 'You are not signed in!',
          data: session,
        ));
      } else {
        // Mock delay to make loading state more noticable
        await Future.delayed(Shared.value.delay);

        Response response = await http.get(
          '${Shared.value.baseURL}/users/$id',
          // options: Options(
          //   headers: {
          //     'Authorization':'Bearer ${LoginData.fromJSON(session.one!).token}'
          //   },
          // ),
        );

        emit(
          ReadSuccessState<UserData>(
            message: 'Data Successfully Loaded',
            data: UserData.fromJSON(response.data['data']),
          ),
        );
      }
    } on DioException catch (e) {
      emit(ReadErrorState(message: e.message ?? '$e', data: e.response));
    } catch (e, s) {
      emit(ReadErrorState(message: '$e', data: s));
    } finally {
      http.close();
    }
  }
}
