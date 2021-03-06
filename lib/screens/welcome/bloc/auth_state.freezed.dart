// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  AuthLoading loading() {
    return AuthLoading();
  }

  AuthAgreementsRequired agreementsRequired(UserData user) {
    return AuthAgreementsRequired(
      user,
    );
  }

  AuthAuthenticated authenticated() {
    return AuthAuthenticated();
  }

  AuthUnauthenticated unauthenticated(
      {bool loading, bool error, String errorMessage}) {
    return AuthUnauthenticated(
      loading: loading,
      error: error,
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result agreementsRequired(UserData user),
    @required Result authenticated(),
    @required
        Result unauthenticated(bool loading, bool error, String errorMessage),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result agreementsRequired(UserData user),
    Result authenticated(),
    Result unauthenticated(bool loading, bool error, String errorMessage),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(AuthLoading value),
    @required Result agreementsRequired(AuthAgreementsRequired value),
    @required Result authenticated(AuthAuthenticated value),
    @required Result unauthenticated(AuthUnauthenticated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(AuthLoading value),
    Result agreementsRequired(AuthAgreementsRequired value),
    Result authenticated(AuthAuthenticated value),
    Result unauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  });
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

abstract class $AuthLoadingCopyWith<$Res> {
  factory $AuthLoadingCopyWith(
          AuthLoading value, $Res Function(AuthLoading) then) =
      _$AuthLoadingCopyWithImpl<$Res>;
}

class _$AuthLoadingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthLoadingCopyWith<$Res> {
  _$AuthLoadingCopyWithImpl(
      AuthLoading _value, $Res Function(AuthLoading) _then)
      : super(_value, (v) => _then(v as AuthLoading));

  @override
  AuthLoading get _value => super._value as AuthLoading;
}

class _$AuthLoading implements AuthLoading {
  _$AuthLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result agreementsRequired(UserData user),
    @required Result authenticated(),
    @required
        Result unauthenticated(bool loading, bool error, String errorMessage),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result agreementsRequired(UserData user),
    Result authenticated(),
    Result unauthenticated(bool loading, bool error, String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(AuthLoading value),
    @required Result agreementsRequired(AuthAgreementsRequired value),
    @required Result authenticated(AuthAuthenticated value),
    @required Result unauthenticated(AuthUnauthenticated value),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(AuthLoading value),
    Result agreementsRequired(AuthAgreementsRequired value),
    Result authenticated(AuthAuthenticated value),
    Result unauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  factory AuthLoading() = _$AuthLoading;
}

abstract class $AuthAgreementsRequiredCopyWith<$Res> {
  factory $AuthAgreementsRequiredCopyWith(AuthAgreementsRequired value,
          $Res Function(AuthAgreementsRequired) then) =
      _$AuthAgreementsRequiredCopyWithImpl<$Res>;
  $Res call({UserData user});
}

class _$AuthAgreementsRequiredCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthAgreementsRequiredCopyWith<$Res> {
  _$AuthAgreementsRequiredCopyWithImpl(AuthAgreementsRequired _value,
      $Res Function(AuthAgreementsRequired) _then)
      : super(_value, (v) => _then(v as AuthAgreementsRequired));

  @override
  AuthAgreementsRequired get _value => super._value as AuthAgreementsRequired;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(AuthAgreementsRequired(
      user == freezed ? _value.user : user as UserData,
    ));
  }
}

class _$AuthAgreementsRequired implements AuthAgreementsRequired {
  _$AuthAgreementsRequired(this.user) : assert(user != null);

  @override
  final UserData user;

  @override
  String toString() {
    return 'AuthState.agreementsRequired(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthAgreementsRequired &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $AuthAgreementsRequiredCopyWith<AuthAgreementsRequired> get copyWith =>
      _$AuthAgreementsRequiredCopyWithImpl<AuthAgreementsRequired>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result agreementsRequired(UserData user),
    @required Result authenticated(),
    @required
        Result unauthenticated(bool loading, bool error, String errorMessage),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return agreementsRequired(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result agreementsRequired(UserData user),
    Result authenticated(),
    Result unauthenticated(bool loading, bool error, String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (agreementsRequired != null) {
      return agreementsRequired(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(AuthLoading value),
    @required Result agreementsRequired(AuthAgreementsRequired value),
    @required Result authenticated(AuthAuthenticated value),
    @required Result unauthenticated(AuthUnauthenticated value),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return agreementsRequired(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(AuthLoading value),
    Result agreementsRequired(AuthAgreementsRequired value),
    Result authenticated(AuthAuthenticated value),
    Result unauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (agreementsRequired != null) {
      return agreementsRequired(this);
    }
    return orElse();
  }
}

abstract class AuthAgreementsRequired implements AuthState {
  factory AuthAgreementsRequired(UserData user) = _$AuthAgreementsRequired;

  UserData get user;
  $AuthAgreementsRequiredCopyWith<AuthAgreementsRequired> get copyWith;
}

abstract class $AuthAuthenticatedCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(
          AuthAuthenticated value, $Res Function(AuthAuthenticated) then) =
      _$AuthAuthenticatedCopyWithImpl<$Res>;
}

class _$AuthAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(
      AuthAuthenticated _value, $Res Function(AuthAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthAuthenticated));

  @override
  AuthAuthenticated get _value => super._value as AuthAuthenticated;
}

class _$AuthAuthenticated implements AuthAuthenticated {
  _$AuthAuthenticated();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result agreementsRequired(UserData user),
    @required Result authenticated(),
    @required
        Result unauthenticated(bool loading, bool error, String errorMessage),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result agreementsRequired(UserData user),
    Result authenticated(),
    Result unauthenticated(bool loading, bool error, String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(AuthLoading value),
    @required Result agreementsRequired(AuthAgreementsRequired value),
    @required Result authenticated(AuthAuthenticated value),
    @required Result unauthenticated(AuthUnauthenticated value),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(AuthLoading value),
    Result agreementsRequired(AuthAgreementsRequired value),
    Result authenticated(AuthAuthenticated value),
    Result unauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticated implements AuthState {
  factory AuthAuthenticated() = _$AuthAuthenticated;
}

abstract class $AuthUnauthenticatedCopyWith<$Res> {
  factory $AuthUnauthenticatedCopyWith(
          AuthUnauthenticated value, $Res Function(AuthUnauthenticated) then) =
      _$AuthUnauthenticatedCopyWithImpl<$Res>;
  $Res call({bool loading, bool error, String errorMessage});
}

class _$AuthUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthUnauthenticatedCopyWith<$Res> {
  _$AuthUnauthenticatedCopyWithImpl(
      AuthUnauthenticated _value, $Res Function(AuthUnauthenticated) _then)
      : super(_value, (v) => _then(v as AuthUnauthenticated));

  @override
  AuthUnauthenticated get _value => super._value as AuthUnauthenticated;

  @override
  $Res call({
    Object loading = freezed,
    Object error = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(AuthUnauthenticated(
      loading: loading == freezed ? _value.loading : loading as bool,
      error: error == freezed ? _value.error : error as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$AuthUnauthenticated implements AuthUnauthenticated {
  _$AuthUnauthenticated({this.loading, this.error, this.errorMessage});

  @override
  final bool loading;
  @override
  final bool error;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState.unauthenticated(loading: $loading, error: $error, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthUnauthenticated &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(errorMessage);

  @override
  $AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith =>
      _$AuthUnauthenticatedCopyWithImpl<AuthUnauthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result agreementsRequired(UserData user),
    @required Result authenticated(),
    @required
        Result unauthenticated(bool loading, bool error, String errorMessage),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated(this.loading, error, errorMessage);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result agreementsRequired(UserData user),
    Result authenticated(),
    Result unauthenticated(bool loading, bool error, String errorMessage),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this.loading, error, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(AuthLoading value),
    @required Result agreementsRequired(AuthAgreementsRequired value),
    @required Result authenticated(AuthAuthenticated value),
    @required Result unauthenticated(AuthUnauthenticated value),
  }) {
    assert(loading != null);
    assert(agreementsRequired != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(AuthLoading value),
    Result agreementsRequired(AuthAgreementsRequired value),
    Result authenticated(AuthAuthenticated value),
    Result unauthenticated(AuthUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticated implements AuthState {
  factory AuthUnauthenticated({bool loading, bool error, String errorMessage}) =
      _$AuthUnauthenticated;

  bool get loading;
  bool get error;
  String get errorMessage;
  $AuthUnauthenticatedCopyWith<AuthUnauthenticated> get copyWith;
}
