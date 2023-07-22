import 'package:finance_gestor/app/features/home/controllers/home_controller.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomeController homeController;

  setUp(() {
    homeController = HomeController();
  });

  test("Should initiate the cubit with the index equals 0", () {
    expect(homeController.selectedIndex, equals(0));
  });

  test("Should present index equals to 1 when the value is changed to 1", () {
    homeController.selectedIndex = 1;

    expect(homeController.selectedIndex, equals(1));
  });

  test("Should present index equals to 0 when the value is changed to 0", () {
    //setUp(() => homeController.selectedIndex = 1);

    homeController.selectedIndex = 0;
    expect(homeController.selectedIndex, equals(0));
  });

  tearDown(() {});
}
