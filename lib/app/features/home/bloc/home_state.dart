import 'package:equatable/equatable.dart';
import 'package:finance_gestor/app/features/home/models/home_item.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class LoadedHomeState extends HomeState {
  final HomeItem homeItem;

  LoadedHomeState({required this.homeItem});

  @override
  List<Object> get props => [homeItem];
}
