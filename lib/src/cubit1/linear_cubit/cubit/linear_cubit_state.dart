part of 'linear_cubit_cubit.dart';

abstract class LinearCubitState extends Equatable {
  const LinearCubitState();

  @override
  List<Object> get props => [];
}

class LinearCubitInitial extends LinearCubitState {
  @override
  List<Object> get props => [];
}

class LinearCubitLoding extends LinearCubitState {
  @override
  List<Object> get props => [];
}

class LinearCubitLoaded extends LinearCubitState {
  final List data;
  const LinearCubitLoaded(this.data);
  @override
  List<Object> get props => [];
}

class LinearCubitError extends LinearCubitState {
  @override
  List<Object> get props => [];
}
