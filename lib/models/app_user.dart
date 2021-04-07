import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AppUser extends Equatable {
  const AppUser({
    @required this.id,
    @required this.email,
  });

  final String id;
  final String email;

  const AppUser.empty() : this(
    id: '',
    email: '',
  );

  @override
  List<Object> get props => [id, email];
}