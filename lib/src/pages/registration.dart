import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginfirebase/src/cubit1/auth/cubit/auth_cubit.dart';
import 'package:loginfirebase/src/pages/home_page.dart';
import 'package:loginfirebase/src/pages/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroller = TextEditingController();

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("successfull")));
        } else if (state is AuthError) {
          return;
        }
        // TODO: implement listener
      },
      child: SafeArea(
        child: Scaffold(
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
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                              hintText: "email", border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                              hintText: "password",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (() {
                            BlocProvider.of<AuthCubit>(context)
                                .registerWithEmailPassword(
                                    _emailcontroller.text,
                                    _passwordcontroller.text);
                          }),
                          child: const Text("register"))
                    ],
                  );
                } else if (state is AuthLoading) {
                  return CircularProgressIndicator();
                } else {
                  return HomeNews();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
