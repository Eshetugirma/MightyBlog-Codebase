import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:blog_application_aastu_grp3/core/theme.dart';
import 'package:blog_application_aastu_grp3/features/article/presentation/bloc/add_article_bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/bloc/auth/auth_bloc_bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/bloc/bloc/register_bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/bloc/login/login_bloc_bloc.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/screens.dart';
import 'package:blog_application_aastu_grp3/features/authentication/presentation/screens/login_screen.dart';
import 'package:blog_application_aastu_grp3/features/get_article/presentation/bloc/bloc/get_article_bloc.dart';
import 'package:blog_application_aastu_grp3/features/get_article/presentation/pages/HomePage.dart';
import 'package:blog_application_aastu_grp3/features/get_article/presentation/widgets/blog_card.dart';
import 'package:blog_application_aastu_grp3/features/profile/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBlocBloc>(
          lazy: false,
          create: (BuildContext context) => LoginBlocBloc(),
        ),
        BlocProvider<AuthBlocBloc>(
          lazy: false,
          create: (BuildContext context) => AuthBlocBloc()..add(AppStarted()),
        ),
        BlocProvider<GetArticleBloc>(
            lazy: false, create: (BuildContext context) => GetArticleBloc()),
        BlocProvider<AddArticleBloc>(
            lazy: false, create: (BuildContext context) => AddArticleBloc()),
        BlocProvider<RegisterBloc>(
          lazy: false,
          create: (BuildContext context) => RegisterBloc(),
        ),
        BlocProvider<UserBloc>(
          lazy: false,
          create: (BuildContext context) => UserBloc(),
        ),
        BlocProvider<RegisterBloc>(
          lazy: false,
          create: (BuildContext context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: customTheme,
          title: '',
          home: SplashScreen()),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBlocBloc, AuthBlocState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          context.read<GetArticleBloc>().add(GetAllArticlesEvent());
          context.read<UserBloc>().add(GetUser());
          // get profile
          return MyHomePage();
        }

        if (state is AuthenticationUnAuthenticated) {
          return SigninToggle();
        }

        return SigninToggle();
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      splashIconSize: 150,
      splashTransition: SplashTransition.slideTransition,
      duration: 5,
      animationDuration: Duration(seconds: 2),
      splash: Image.asset('assets/images/a2sv_logo.png'),
      nextScreen: SecondScreen(),
    ));
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final LocalDataSource lds = LocalDataSource();
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            await lds.deleteFromStorage("Token");
            print("logging out");
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          child: Text("LOGOUT")),
    );
  }
}
