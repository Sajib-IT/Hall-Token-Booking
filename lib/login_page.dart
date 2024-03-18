import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tokenbooking/splash_sreen2.dart';
import 'register_page.dart';
import 'home_page.dart';

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
                        (day) => DropdownMenuItem(
                          value: day,
                          child: Text(day),
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
                      //Navigator.pushNamed(context,"homepage");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => SplashScreen2(selectedItem)));

                      Fluttertoast.showToast(
                          msg: "Succesfull Logged in",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          fontSize: 18.0);
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('no user oound'),backgroundColor: Colors.red,));
                      Fluttertoast.showToast(
                          msg: "wrong email or password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER_LEFT,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    if (e.code == 'wrong-password') {
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('no match pass ound'),backgroundColor: Colors.red,));
                      Fluttertoast.showToast(
                          msg: "wrong email or password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER_LEFT,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  } catch (e) {
                    print(e);
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
}
