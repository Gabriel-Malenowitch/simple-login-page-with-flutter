import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login> {
  String username = '';
  String password = '';

  Future<String?> handlePressed() {
    String parsedPassword = password.split('').map((character) => '*').join('');

    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Nice!'),
              content: Text('Hello $username with password $parsedPassword!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Thanks!'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hello world!")),
        body: Center(
            child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: IntrinsicHeight(
                      child: SizedBox(
                          height: 350,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Username'),
                                  onChanged: (value) {
                                    username = value;
                                  }),
                              const SizedBox(height: 15),
                              TextField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Password'),
                                  onChanged: (value) {
                                    password = value;
                                  }),
                              const SizedBox(height: 15),
                              TextButton(
                                  onPressed:
                                      //(username.split('').isNotEmpty &&
                                      //         password.split('').isNotEmpty) ?
                                      handlePressed
                                  // : null
                                  ,
                                  child: const Text("Submit")),
                            ],
                          )),
                    )))));
  }
}
