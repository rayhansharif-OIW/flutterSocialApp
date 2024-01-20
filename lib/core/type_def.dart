import 'package:fpdart/fpdart.dart';
import 'package:project_one/core/core.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
