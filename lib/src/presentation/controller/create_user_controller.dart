import 'package:mobx/mobx.dart';
part "create_user_controller.g.dart";

class CreateUserController = _CreateUserControllerBase
    with _$CreateUserController;

abstract class _CreateUserControllerBase with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String? password;

  @action
  void setPassword(String value) => password = value;

  @observable
  String? confirmPassword;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;
}
