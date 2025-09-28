import 'package:flutter/material.dart';
import 'package:pp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            "Welcome",
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
                ),
                TextFormField(
                  obscureText: true, //dot dot ban jayega password
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "password",
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () async{
                    setState(() {
                      //setstate jab use karna hai jab hume state mai kuch change karna ho..
                      changeButton = true;
                    });
                      await Future.delayed(Duration(seconds:1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 50,

                    alignment: Alignment.center,
                    child: changeButton ? Icon(Icons.done,
                    color:Colors.white):Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                     borderRadius: BorderRadius.circular(changeButton ? 50 : 8),//when used a animatedcontainer
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
    );
  }
}
