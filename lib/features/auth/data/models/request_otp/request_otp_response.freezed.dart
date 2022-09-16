// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestOtpResponse {
  PhoneAuthCredential? get credential => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  int? get resendToken => throw _privateConstructorUsedError;
  FirebaseAuthException? get exception => throw _privateConstructorUsedError;
  bool get isTimeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestOtpResponseCopyWith<RequestOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpResponseCopyWith<$Res> {
  factory $RequestOtpResponseCopyWith(
          RequestOtpResponse value, $Res Function(RequestOtpResponse) then) =
      _$RequestOtpResponseCopyWithImpl<$Res>;
  $Res call(
      {PhoneAuthCredential? credential,
      String? verificationId,
      int? resendToken,
      FirebaseAuthException? exception,
      bool isTimeout});
}

/// @nodoc
class _$RequestOtpResponseCopyWithImpl<$Res>
    implements $RequestOtpResponseCopyWith<$Res> {
  _$RequestOtpResponseCopyWithImpl(this._value, this._then);

  final RequestOtpResponse _value;
  // ignore: unused_field
  final $Res Function(RequestOtpResponse) _then;

  @override
  $Res call({
    Object? credential = freezed,
    Object? verificationId = freezed,
    Object? resendToken = freezed,
    Object? exception = freezed,
    Object? isTimeout = freezed,
  }) {
    return _then(_value.copyWith(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: resendToken == freezed
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      isTimeout: isTimeout == freezed
          ? _value.isTimeout
          : isTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RequestOtpResponseCopyWith<$Res>
    implements $RequestOtpResponseCopyWith<$Res> {
  factory _$$_RequestOtpResponseCopyWith(_$_RequestOtpResponse value,
          $Res Function(_$_RequestOtpResponse) then) =
      __$$_RequestOtpResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhoneAuthCredential? credential,
      String? verificationId,
      int? resendToken,
      FirebaseAuthException? exception,
      bool isTimeout});
}

/// @nodoc
class __$$_RequestOtpResponseCopyWithImpl<$Res>
    extends _$RequestOtpResponseCopyWithImpl<$Res>
    implements _$$_RequestOtpResponseCopyWith<$Res> {
  __$$_RequestOtpResponseCopyWithImpl(
      _$_RequestOtpResponse _value, $Res Function(_$_RequestOtpResponse) _then)
      : super(_value, (v) => _then(v as _$_RequestOtpResponse));

  @override
  _$_RequestOtpResponse get _value => super._value as _$_RequestOtpResponse;

  @override
  $Res call({
    Object? credential = freezed,
    Object? verificationId = freezed,
    Object? resendToken = freezed,
    Object? exception = freezed,
    Object? isTimeout = freezed,
  }) {
    return _then(_$_RequestOtpResponse(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: resendToken == freezed
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      isTimeout: isTimeout == freezed
          ? _value.isTimeout
          : isTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RequestOtpResponse implements _RequestOtpResponse {
  _$_RequestOtpResponse(
      {this.credential,
      this.verificationId,
      this.resendToken,
      this.exception,
      this.isTimeout = false});

  @override
  final PhoneAuthCredential? credential;
  @override
  final String? verificationId;
  @override
  final int? resendToken;
  @override
  final FirebaseAuthException? exception;
  @override
  @JsonKey()
  final bool isTimeout;

  @override
  String toString() {
    return 'RequestOtpResponse(credential: $credential, verificationId: $verificationId, resendToken: $resendToken, exception: $exception, isTimeout: $isTimeout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestOtpResponse &&
            const DeepCollectionEquality()
                .equals(other.credential, credential) &&
            const DeepCollectionEquality()
                .equals(other.verificationId, verificationId) &&
            const DeepCollectionEquality()
                .equals(other.resendToken, resendToken) &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            const DeepCollectionEquality().equals(other.isTimeout, isTimeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(credential),
      const DeepCollectionEquality().hash(verificationId),
      const DeepCollectionEquality().hash(resendToken),
      const DeepCollectionEquality().hash(exception),
      const DeepCollectionEquality().hash(isTimeout));

  @JsonKey(ignore: true)
  @override
  _$$_RequestOtpResponseCopyWith<_$_RequestOtpResponse> get copyWith =>
      __$$_RequestOtpResponseCopyWithImpl<_$_RequestOtpResponse>(
          this, _$identity);
}

abstract class _RequestOtpResponse implements RequestOtpResponse {
  factory _RequestOtpResponse(
      {final PhoneAuthCredential? credential,
      final String? verificationId,
      final int? resendToken,
      final FirebaseAuthException? exception,
      final bool isTimeout}) = _$_RequestOtpResponse;

  @override
  PhoneAuthCredential? get credential;
  @override
  String? get verificationId;
  @override
  int? get resendToken;
  @override
  FirebaseAuthException? get exception;
  @override
  bool get isTimeout;
  @override
  @JsonKey(ignore: true)
  _$$_RequestOtpResponseCopyWith<_$_RequestOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
