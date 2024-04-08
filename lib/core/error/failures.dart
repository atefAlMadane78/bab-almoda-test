import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class OfflineFailure extends Failure {
  const OfflineFailure() : super("Offline failure");

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({String message = ''}) : super(message);

  @override
  List<Object> get props => [];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({String message = 'Empty Cache Failuer'})
      : super(message);

  @override
  List<Object> get props => [];
}

class EmptyServerListFailure extends Failure {
  const EmptyServerListFailure({String message = 'Empty Server Failuer'})
      : super(message);

  @override
  List<Object> get props => [];
}
