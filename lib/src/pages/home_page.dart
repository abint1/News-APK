import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginfirebase/src/cubit1/auth/cubit/auth_cubit.dart';
import 'package:loginfirebase/src/cubit1/linear_cubit/cubit/linear_cubit_cubit.dart';
import 'package:loginfirebase/src/pages/content.dart';
import 'package:loginfirebase/src/pages/login.dart';
import 'package:loginfirebase/src/pages/registration.dart';

class HomePage extends StatefulWidget {
  final UserCredential userCredential;
  const HomePage({super.key, required this.userCredential});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.userCredential.user!.email ?? ""),
      ),
    );
  }
}

//news home
class HomeNews extends StatefulWidget {
  const HomeNews({super.key});

  @override
  State<HomeNews> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Icon(
                Icons.supervised_user_circle_sharp,
                size: 80,
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.verified_user),
                  Text('Profile'),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [Icon(Icons.notifications), Text('Notifications')],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.key),
                  Text('Forgot Password'),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.settings),
                  Text('Settings'),
                ],
              ),
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              title: Row(
                children: [
                  Icon(Icons.logout),
                  Text('Logout'),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('HEAD LINES'),
        actions: [
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Icon(Icons.supervised_user_circle_sharp),
          )
        ],
      ),
      body: BlocBuilder<LinearCubitCubit, LinearCubitState>(
        builder: (context, state) {
          if (state is LinearCubitInitial) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          } else if (state is LinearCubitError) {
            return Icon(Icons.error);
          } else if (state is LinearCubitLoaded) {
            final result = state.data;
            return ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity(vertical: 4),
                      title: Text(
                        result[index].title.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 148, 248),
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        result[index].description.toString(),
                      ),
                      trailing: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    result[index].urlToImage.toString()),
                                fit: BoxFit.fill)),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewContent(
                              data: result[index],
                            ),
                          )),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
