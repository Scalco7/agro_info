sealed class Result<S, E> {}

class Success<S, E> extends Result<S, E> {
  final S value;
  Success(this.value);
}

class Failure<S, E> extends Result<S, E> {
  final E error;
  Failure(this.error);
}