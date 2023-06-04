import 'package:finance_gestor/app/features/home/models/home_item.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoaded extends HomeState {
  final HomeItem homeItem;

  HomeStateLoaded({required this.homeItem});
}
