import 'dart:developer';

import 'package:azinova_machine_test/common.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../assets.dart';
import '../routes.dart';
import '../widget.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();

  var autoValidate = AutovalidateMode.disabled;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void onClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      (emailController.text == 'admin' && passwordController.text == 'admin')
          ? Navigator.pushNamed(context, Routes.homeScreen)
          : showSnackBar(context, "Credentials mismatch");
    } else {
      setState(() {
        autoValidate = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
              text: "Let's ",
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: [
                TextSpan(
                    text: 'SignIn',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ))
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: IntrinsicHeight(
            child: Form(
              autovalidateMode: autoValidate,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(loginBg, fit: BoxFit.cover),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          Icons.account_circle_sharp,
                          color: Colors.grey,
                        ),
                        labelText: 'Email',
                        labelStyle:
                        TextStyle(color: Color(0xffC4D1DB), fontSize: 14),
                        alignLabelWithHint: true,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE2E2E2)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE2E2E2)),
                        ),
                        border: null,
                        fillColor: Colors.transparent,
                        filled: true),
                    validator: (value) {
                      if (value!.isEmpty /*||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)*/) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.grey,
                        ),
                        labelText: 'Password',
                        labelStyle:
                        TextStyle(color: Color(0xffC4D1DB), fontSize: 14),
                        alignLabelWithHint: true,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE2E2E2)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE2E2E2)),
                        ),
                        border: null,
                        fillColor: Colors.transparent,
                        filled: true),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  fullWidthPrimaryButton(context, () => onClick(), 'Login'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
