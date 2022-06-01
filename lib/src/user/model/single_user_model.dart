import 'user_model.dart';
import '../widget/user_page.dart';
import '../cubit/user_cubit.dart';
import '../../etc/model/support_model.dart';

/// Parent model of [UserModel] used in [UserPage].
///
/// ```dart
/// {
///     "data": { ... },
///     "support": { ... },
/// }
/// ```
class SingleUserModel {
  /// Decoded User Model from API.
  final UserModel data;

  /// Decoded Support Model from API.
  final SupportModel support;

  /// Used to receive model from [UserCubit.fetching].
  SingleUserModel({required this.data, required this.support});

  /// Convert json from API to [SingleUserModel].
  factory SingleUserModel.fromJson(Map<String, dynamic> json) {
    return SingleUserModel(
        data: UserModel.fromJson(json["data"]),
        support: SupportModel.fromJson(json["support"]));
  }
}
