

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
    @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServerFailure extends Failure{}