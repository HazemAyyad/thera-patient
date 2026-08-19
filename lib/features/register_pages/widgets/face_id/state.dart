import 'package:equatable/equatable.dart';

abstract class FaceIDState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FaceIDInitial extends FaceIDState {}

class FaceIDLoading extends FaceIDState {}

class FaceIDSuccess extends FaceIDState {}

class FaceIDFailure extends FaceIDState {
  final String message;

  FaceIDFailure(this.message);
}
