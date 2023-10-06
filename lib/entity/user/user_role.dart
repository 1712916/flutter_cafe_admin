import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_role.freezed.dart';
part 'user_role.g.dart';

@freezed
class UserRole with _$UserRole {
  const factory UserRole({
    @Default(0) int id,
    @Default('') String accountName,
    @Default('') String userName,
    @Default('') String email,
    int? age,
  }) = _UserRole;

  factory UserRole.fromJson(Map<String, Object?> json) => _$UserRoleFromJson(json);
}

class CheckUserRole {
  late final Set<UserRole> _roles;

  CheckUserRole(Iterable<UserRole> roles) {
    _roles = roles.toSet();
  }

  bool checkRole(UserRole role) {
    return _roles.contains(role);
  }

  bool checkRoles(Iterable<UserRole> roles) {
    return _roles.intersection(roles.toSet()).isNotEmpty;
  }
}
