import 'package:bloc_test/bloc_test.dart';
import 'package:finance_gestor/app/features/home/bloc/home_cubit.dart';
import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomeCubit homeCubit;
  late LoadedHomeState dashboardState;
  late LoadedHomeState billsState;
  setUp(() {
    homeCubit = HomeCubit();

    dashboardState = LoadedHomeState(homeItem: homeCubit.dashboardState);
    billsState = LoadedHomeState(homeItem: homeCubit.billState);
  });

  test("Should initiate the cubit with the HomeStateDashboard", () {
    expect(homeCubit.state, dashboardState);
  });

  blocTest(
    "Shoud change state to Bill List when using action to index 1",
    build: () => homeCubit,
    act: (bloc) => bloc.changeView(1),
    expect: () => [billsState],
  );

  blocTest(
    "Should present State of Dashboard when using change view to index 0",
    setUp: () => homeCubit.changeView(1),
    build: () => homeCubit,
    act: (bloc) => bloc.changeView(0),
    expect: () => [dashboardState],
  );

  tearDown(() {});
}
