abstract class Failure {
  const Failure({this.message = 'An unknown error occurred.'});

  /// The associated error message.
  final String message;
}

class CustomFailure extends Failure {
  const CustomFailure({super.message});
}

class KashFailure extends Failure {
  const KashFailure({super.message});
}
