import 'package:clean_archeticture_movies/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUserCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  NoParameters();

  @override
  List<Object?> get props => [];
}
