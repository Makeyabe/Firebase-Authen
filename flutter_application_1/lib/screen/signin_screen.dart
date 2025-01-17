import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/auth_service.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          height: 280,
          width: 300,
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "TODO",
                style: TextStyle(fontSize: 40),
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                        var res = await AuthService().reqistration(
                            email: "poramet.si@gmail.com",
                            password: "123456789",
                            confirm: "123456789");
                        if (res == 'success') {
                          //goto login
                        }
                        print(res);
                      },
                      child: const Text("Sign up")),
                  TextButton(
                      onPressed: () async {
                        var res = await AuthService().signin(
                            email: "poramet.si@gmail.com",
                            password: "123456789");
                        if (res == 'success') {
                          //goto main app
                        }
                        print(res);
                      },
                      child: const Text("Sign in")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
