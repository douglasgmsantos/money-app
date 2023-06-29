import 'package:mobx/mobx.dart';
part "auth_controller.g.dart";

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String? password;

  @action
  void setPassword(String value) => password = value;
}
