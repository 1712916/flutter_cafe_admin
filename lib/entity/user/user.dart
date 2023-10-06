import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'user_role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(0) int id,
    @Default('') String accountName,
    @Default('') String userName,
    @Default('') String email,
    int? age,
    @Default([]) List<UserRole> roles,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
