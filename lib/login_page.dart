import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tokenbooking/splash_sreen2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String selectedItem = 'Student';
  List options = ['Admin', 'Student'];

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('lib/Assets/login1.png'),
                height: 250,
              ),
              const SizedBox(
                height: 35,
              ),
              DropdownButton(
                  value: selectedItem,
                  items: options
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value.toString();
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                textAlign: TextAlign.center,
                obscureText: passToggle,
                decoration: InputDecoration(
                    hintText: 'Enter your pasword',
                    labelText: 'Password',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    user = userCredential.user;
                    if (user != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => SplashScreen2(selectedItem)));
                      toastMessage(isSuccess: true);
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      toastMessage();
                    }
                    if (e.code == 'wrong-password') {
                      toastMessage();
                    }
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, height: 1),
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  InkWell(
                    child: const Text(
                      "Register now  ",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "register");
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  toastMessage({bool isSuccess = false}) {
    Fluttertoast.showToast(
        msg: isSuccess  ? "Successful Logged in": "wrong email or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isSuccess ? Colors.blue : Colors.red,
        textColor: Colors.white,
        fontSize: isSuccess ? 18 : 16);
  }
}
