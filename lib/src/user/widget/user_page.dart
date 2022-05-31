import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/single_user_model.dart';
import '../cubit/user_cubit.dart';

part 'edit_page.dart';
part 'user_loading_widget.dart';
part 'user_failed_widget.dart';
part 'user_succeed_widget.dart';

/// User Page to display fetched User Data from [UserCubit.fetching].
class UserPage extends StatelessWidget {
  /// Displaying User Data from API.
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff31428B),
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(builder: (_, state) {
          if (state is UserFailed) {
            return UserFailedWidget(message: state.message);
          } else if (state is UserSucceed) {
            return UserSucceedWidget(model: state.model);
          } else {
            return const UserLoadingWidget();
          }
        }),
      ),
    );
  }
}
