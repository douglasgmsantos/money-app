// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserController on _CreateUserControllerBase, Store {
  late final _$nameAtom =
      Atom(name: '_CreateUserControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_CreateUserControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_CreateUserControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_CreateUserControllerBase.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$_CreateUserControllerBaseActionController =
      ActionController(name: '_CreateUserControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateUserControllerBaseActionController
        .startAction(name: '_CreateUserControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CreateUserControllerBaseActionController
        .startAction(name: '_CreateUserControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_CreateUserControllerBaseActionController
        .startAction(name: '_CreateUserControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_CreateUserControllerBaseActionController
        .startAction(name: '_CreateUserControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword}
    ''';
  }
}
