import 'package:flutter/material.dart';
import 'package:pp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        //setstate jab use karna hai jab hume state mai kuch change karna ho..
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      //await for back
      setState(() {
        //setstate jab use karna hai jab hume state mai kuch change karna ho..
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              "Welcome $name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),

              // child:SingleChildScrollView()// scroll the accessive amount of content
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true, //dot dot ban jayega password
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password cannot be empty";
                      } else if (value.length < 6) {
                        return "password lengh should be atleast";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  Material(
                    // ribble efects by material
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(
                      changeButton ? 50 : 8,
                    ), //when used a animatedcontainer
                    child: InkWell(
                      //gestrue detector but there is not a ribble effect
                      onTap: () => moveToHome(context),

                      child: AnimatedContainer(
                        // Ink(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                        // decoration: BoxDecoration(
                        //   color: Colors.deepPurple,
                        // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,

                        // ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(
                  //     backgroundColor: Color.fromRGBO(8, 0, 244, 1),
                  //     minimumSize: Size(150, 40),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
