import 'package:equatable/equatable.dart';

abstract class BaseEnum<T> extends Equatable {
  final T rawValue;

  const BaseEnum(this.rawValue);

  @override
  List<Object?> get props => [rawValue];
}
