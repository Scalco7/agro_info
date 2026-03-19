sealed class Result<S, E> {}

class Success<S, E> implements Result<S, E> {
  final S value;
  Success(this.value);
}

class Failure<S, E> implements Result<S, E> {
  final E error;
  Failure(this.error);
}