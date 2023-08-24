part of 'prueba_bloc.dart';

sealed class PruebaState extends Equatable {
  const PruebaState();
  
  @override
  List<Object> get props => [];
}

final class PruebaInitial extends PruebaState {}
