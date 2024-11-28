class Failure {
  final String? msg;
  const Failure({this.msg});
}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {
  const NetworkFailure({super.msg});
}

class CacheFailure extends Failure {}
