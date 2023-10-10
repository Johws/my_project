import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:my_project/main.dart' as app;

void main() {
  group('Case: Login', () {
    patrolTest(
      'Login sucess',
      (PatrolIntegrationTester $) async {
        app.main();
        await $(#login).enterText('joao.santos@gmail.com');
        await $(#password).enterText('27519254');
        await $(#confirm).tap();
      },
    );
  });
}
