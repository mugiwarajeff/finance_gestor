import 'package:bloc_test/bloc_test.dart';
import 'package:finance_gestor/app/features/home/bloc/home_cubit.dart';
import 'package:finance_gestor/app/features/home/bloc/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomeCubit homeCubit;
  late HomeStateDashboard homeStateDashboard;
  late HomeStateBills homeStateBills;
  setUp(() {
    homeCubit = HomeCubit();
    homeStateDashboard = HomeStateDashboard();
    homeStateBills = HomeStateBills();
  });

  test("Should initiate the cubit with the HomeStateDashboard", () {
    expect(homeCubit.state, homeStateDashboard);
  });

  blocTest(
    "Shoud change state to Bill List when using action to index 1",
    build: () => homeCubit,
    act: (bloc) => bloc.changeView(1),
    expect: () => [homeStateBills],
  );

  blocTest(
    "Should present State of Dashboard when using change view to index 0",
    setUp: () => homeCubit.changeView(1),
    build: () => homeCubit,
    act: (bloc) => bloc.changeView(0),
    expect: () => [homeStateDashboard],
  );

  tearDown(() {});
}
