import 'package:blog_application_aastu_grp3/features/authentication/presentation/screens.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/screens/login_screen.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/widgets/nav_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Login UI Page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home:Login(toggleAuth: (){},)
    ));

    expect(find.byType(LoginForm), findsOneWidget);
    expect(find.byType(NavBarImage), findsOneWidget);
    expect(find.text("Welcome back"), findsOneWidget);
    expect(find.text("Sign in with your account"), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text("Forgot your password?"), findsOneWidget);
    expect(find.text("Reset here"), findsOneWidget);
  });

  testWidgets("Sign Up Page Testing", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignUp(toggleAuth: (){}),
    ));

    expect(find.byType(SignupForm), findsOneWidget);
    expect(find.byType(NavBarImage), findsOneWidget);
    expect(find.text("Welcome"), findsOneWidget);
    expect(find.text("provide credentials to signup"), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text("Have an account?"), findsOneWidget);
    expect(find.text("Login"), findsOneWidget);

  });


  testWidgets("Toggle Testing", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home:SigninToggle()
    ));

    expect(find.text("SIGN UP"), findsOneWidget);

    await tester.tap(find.text("SIGN UP"));
    await tester.pumpAndSettle();

    expect(find.byType(SignUp), findsOneWidget);

    expect(find.text("LOGIN"), findsOneWidget);

    await tester.tap(find.text("LOGIN"));
    await tester.pumpAndSettle();

    expect(find.byType(Login), findsOneWidget);
  });
}