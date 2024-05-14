part of '../home.dart';

class HomeRequest extends Cubit<ReadStates> {
  HomeRequest([super.initialState = const ReadLoadingState()]) {
    run();
  }

  Future<void> run() async {
    emit(const ReadLoadingState());
    Dio http = Dio();

    try {
      SharedResponse session = await Login.store.read();

      if (session.one == null) {
        emit(ReadErrorState(message: 'You are not signed in!', data: session));
      } else {
        // Mock delay to make loading state more noticable
        await Future.delayed(Shared.value.delay);

        Response response = await http.get(
          '${Shared.value.baseURL}/users?page=2',
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${LoginData.fromJSON(session.one!).token}'
            },
          ),
        );

        emit(
          ReadSuccessState<HomeData>(
            message: 'Successfully Loading Data',
            data: HomeData.fromJSON(response.data),
          ),
        );
      }
    } on DioException catch (e) {
      emit(ReadErrorState(message: e.message ?? '$e', data: e.stackTrace));
    } catch (e, s) {
      emit(ReadErrorState(message: '$e', data: s));
    }
  }
}
