import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginfirebase/src/cubit1/auth/cubit/auth_cubit.dart';
import 'package:loginfirebase/src/pages/home_page.dart';
import 'package:loginfirebase/src/pages/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          final UserCredential result = state.userCredential;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        userCredential: result,
                      )));
        } else if (state is AuthError) {
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Daily Hunt'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "EMAIL", border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "PASSWORD", border: OutlineInputBorder()),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .loginWithEmailPasswrd(_emailController.text,
                                  _passwordController.text);
                        },
                        child: Text("LOGIN")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        },
                        child: Text("signup"))
                  ],
                );
              } else if (state is AuthLoading) {
                return CircularProgressIndicator();
              } else {
                // return Container(
                // color: Colors.amber,
                // height: 100,
                // width: 100,
                // );
                return HomeNews();
              }
            },
          ),
        ),
      ),
    );
  }
}
