// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verify_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerifyOtpResponse {
  UserCredential? get credential => throw _privateConstructorUsedError;
  FirebaseAuthException? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyOtpResponseCopyWith<VerifyOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpResponseCopyWith<$Res> {
  factory $VerifyOtpResponseCopyWith(
          VerifyOtpResponse value, $Res Function(VerifyOtpResponse) then) =
      _$VerifyOtpResponseCopyWithImpl<$Res>;
  $Res call({UserCredential? credential, FirebaseAuthException? exception});
}

/// @nodoc
class _$VerifyOtpResponseCopyWithImpl<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  _$VerifyOtpResponseCopyWithImpl(this._value, this._then);

  final VerifyOtpResponse _value;
  // ignore: unused_field
  final $Res Function(VerifyOtpResponse) _then;

  @override
  $Res call({
    Object? credential = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
    ));
  }
}

/// @nodoc
abstract class _$$_VerifyOtpResponseCopyWith<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  factory _$$_VerifyOtpResponseCopyWith(_$_VerifyOtpResponse value,
          $Res Function(_$_VerifyOtpResponse) then) =
      __$$_VerifyOtpResponseCopyWithImpl<$Res>;
  @override
  $Res call({UserCredential? credential, FirebaseAuthException? exception});
}

/// @nodoc
class __$$_VerifyOtpResponseCopyWithImpl<$Res>
    extends _$VerifyOtpResponseCopyWithImpl<$Res>
    implements _$$_VerifyOtpResponseCopyWith<$Res> {
  __$$_VerifyOtpResponseCopyWithImpl(
      _$_VerifyOtpResponse _value, $Res Function(_$_VerifyOtpResponse) _then)
      : super(_value, (v) => _then(v as _$_VerifyOtpResponse));

  @override
  _$_VerifyOtpResponse get _value => super._value as _$_VerifyOtpResponse;

  @override
  $Res call({
    Object? credential = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_VerifyOtpResponse(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as UserCredential?,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
    ));
  }
}

/// @nodoc

class _$_VerifyOtpResponse implements _VerifyOtpResponse {
  _$_VerifyOtpResponse({this.credential, this.exception});

  @override
  final UserCredential? credential;
  @override
  final FirebaseAuthException? exception;

  @override
  String toString() {
    return 'VerifyOtpResponse(credential: $credential, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyOtpResponse &&
            const DeepCollectionEquality()
                .equals(other.credential, credential) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(credential),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_VerifyOtpResponseCopyWith<_$_VerifyOtpResponse> get copyWith =>
      __$$_VerifyOtpResponseCopyWithImpl<_$_VerifyOtpResponse>(
          this, _$identity);
}

abstract class _VerifyOtpResponse implements VerifyOtpResponse {
  factory _VerifyOtpResponse(
      {final UserCredential? credential,
      final FirebaseAuthException? exception}) = _$_VerifyOtpResponse;

  @override
  UserCredential? get credential;
  @override
  FirebaseAuthException? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyOtpResponseCopyWith<_$_VerifyOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
