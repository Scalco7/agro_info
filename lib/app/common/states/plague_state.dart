import 'package:agro_info/app/common/models/plague.dart';

sealed class IPlagueState {}

class LoadingPlagueState implements IPlagueState {}

class LoadedPlagueState implements IPlagueState {
  final List<Plague> plagues;

  LoadedPlagueState(this.plagues);
}

class ErrorPlagueState implements IPlagueState {
  final String errorMessage;

  ErrorPlagueState({required this.errorMessage});
}
