import 'package:bloc/bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInital());
}

abstract class UsersState {}

class UsersInital extends UsersState {}
