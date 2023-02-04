import 'package:flutter/material.dart';
import 'package:loginfirebase/src/cubit1/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginfirebase/src/cubit1/linear_cubit/cubit/linear_cubit_cubit.dart';
import 'package:loginfirebase/src/pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => LinearCubitCubit()),
      ],
      child: MaterialApp(
        title: 'flutter demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
