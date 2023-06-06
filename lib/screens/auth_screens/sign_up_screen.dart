import 'package:eco_quest_vr/screens/auth_screens/login_screen.dart';
import 'package:eco_quest_vr/utils/custom_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? selectedCountry;

  List<String> countries = [
    'Nigeria',
    'United States',
    'Canada',
    // Add more countries here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create an account",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please sign up to continue",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomField(
                  hintText: 'Enter your name',
                  prefixIcon: const Icon(Icons.person),
                  obscureText: false),
              const SizedBox(
                height: 15.0,
              ),
              CustomField(
                  hintText: 'Enter email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  obscureText: false),
              const SizedBox(
                height: 15.0,
              ),
              CustomField(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outlined),
                  obscureText: false),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        blurRadius: 6,
                        color: Colors.grey.shade400),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DropdownButtonFormField(
                    value: selectedCountry,
                    items: countries.map((country) {
                      return DropdownMenuItem(
                        alignment: AlignmentDirectional.centerStart,
                        value: country,
                        child: Text(
                          country,
                          style: const TextStyle(fontSize: 13),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Country',
                        contentPadding: EdgeInsets.only(left: 20, top: 10.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Forgot password",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (_) => const LoginScreen()));
                    },
                    child: const Text(
                      "  Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
