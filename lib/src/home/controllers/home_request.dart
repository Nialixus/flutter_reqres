part of '../home.dart';

class HomeRequest extends Cubit<ReadStates> {
  HomeRequest([super.initialState = const ReadLoadingState()]) {
    run();
  }

  Future<void> run() async {
    emit(const ReadLoadingState());
    // Mock delay to make loading state more noticable
    await Future.delayed(Shared.value.delay);

    Dio http = Dio();

    try {
      SharedResponse session = await Login.session.read();

      if (session.one == null) {
        emit(ReadErrorState<SharedResponse>(
          message: 'You are not signed in!',
          data: session,
        ));
      } else {
        Response response = await http.get(
          '${Shared.value.baseURL}/users?page=2',
          // options: Options(
          //   headers: {
          //     'Authorization':'Bearer ${LoginData.fromJSON(session.one!).token}'
          //   },
          // ),
        );

        emit(
          ReadSuccessState<HomeData>(
            message: 'Data Successfully Loaded',
            data: HomeData.fromJSON(response.data),
          ),
        );
      }
    } on DioException catch (e) {
      emit(ReadErrorState(message: e.message ?? '$e', data: e.response));
    } catch (e, s) {
      emit(ReadErrorState(message: '$e', data: s));
    }
  }
}
