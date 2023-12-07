import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dev4passion_mdapp_patient/screens/authenticate/home.dart';
import 'package:dev4passion_mdapp_patient/screens/authenticate/signin.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();


class Signin extends StatefulWidget {
  const Signin({ Key? key }) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();


      String status = "";

  void initState() {
    super.initState();

    status = "Not authenticated";
  }

  void signInAnon() async {
    User? user = (await auth.signInAnonymously()).user;
     if (user!= null && user.isAnonymous == true) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        setState((){
            status = "Signed In Anonymously";
        });
            } else {
                status = "Sign In failed";
            }
  }

  void _signIn() async {
    // final User user = ( await _auth.signInWithEmailAndPassword(email: _emailController, password: _passwordController)).user;
        final User? user = ( await auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text.toString())).user;
        print(_emailController.text);
        print(_passwordController.text);
        

    if (user != null) {
      //  Navigator.of(context).pushNamed('/home');
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }
  }

  void _signOut() async {

    Navigator.pop(context);
   // Navigator.pushNamedAndRemoveUntil(context, "/signin", (Route<dynamic> route) => false);
    await auth.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Signin()));
   // Navigator.of(context).pushNamedAndRemoveUntil('/signin', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
      
    // );

    return Scaffold(
      // drawer: Sidemenu(),
     // drawer: SideMenu(),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
        title: Text("HOME"),
        backgroundColor: Colors.pinkAccent,
        
        actions: <Widget>[
            TextButton(onPressed: 
            (){
                signInAnon();
                

               // print("register");
            },
            child: Text("Anonymous Signin"),
            ),

            TextButton(onPressed: 
            () async {
               // signInAnon();
                
                _signOut();

               // print("register");
            },
            child: Text("Signout"),
            ),
        ],
      ),
    
         body: new Container (
            padding: new EdgeInsets.all(32.0),
            child: new Column(
                children: <Widget> [
                    new Text(status),
                    new Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxissAlignment: CrossAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                            //ok
                            // MaterialButton( onPressed: signOut, child: Text('Sign Out')),

                            // MaterialButton( onPressed: signInAnon, child: Text('Sign In Anon')),
                            //ok
                         
                         
                         
                           // MaterialButton( onPressed: signinanon, child: Text('Sign In Anoon'),),

             
           


                            // RaisedButton(onPressed: signOut, child: Text('Sign Out'),),
                            ////
                            // RaisedButton(onPressed: signOut, child: Text('Sign Out'),),
                            // RaisedButton(onPressed: signInAnon, child: Text('Sin In Anon'),),
                            ////
                        ],
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(15,18,0,0),
                        child: Text("Hello",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold
                        )),
                    ),

                    Container(
                        padding: EdgeInsets.only(top:35, left:20, right: 30),
                        child: Column(
                            children: <Widget>[
                                TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                ),

                                SizedBox(height:20,),

                                TextField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.green),
                                        )
                                    ),
                                    obscureText: true,
                                ),

                                 SizedBox(height:5.0,),

                                 Container(
                                    alignment: Alignment(1,0),
                                    padding: EdgeInsets.only(top:15, left:20),
                                    child: InkWell(

                                         child: GestureDetector (
                                        onTap: (){

                                            print("lakjsdfl");
                                            Navigator.of(context).pushNamed('/forgotpassword');

                                        },





                                        child: Text(
                                            'Forgot Password',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                                decoration: TextDecoration.underline,
                                            ),
                                        ),

                                    ),
                                    ),
                                 ),

                                 SizedBox(height: 40,),
                                 Container(
                                    height: 40,
                                    child: Material(
                                        borderRadius: BorderRadius.circular(20),
                                        shadowColor: Colors.greenAccent,
                                        color: Colors.black,
                                        elevation: 7,
                                        child: GestureDetector(
                                            onTap: (){
                                                _signIn();
                                            },
                                            child: Center(
                                                child: Text(
                                                    'Login',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'Montserrat',
                                                    ),
                                                ),
                                            ),

                                        ),
                                    ),
                                 ),

                                 SizedBox(height: 15,),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        InkWell(
                                            onTap: () {
                                                Navigator.of(context).pushNamed('/signup');
                                            },
                                                child: Text(
                                                    'Register',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight.bold,
                                                        decoration: TextDecoration.underline,
                                                    )
                                                )
                                            
                                        ),
                                    ]
                                 ),




                            ],
                        ),
                    ),
                    
                  


                    // Container(
                    //     padding: EdgeInsets.only(top:35, left:20, right: 30),
                    //     child: Column(
                    //         children: <Widget>[
                    //             TextField(
                    //                 decoration: InputDecoration(
                    //                     labelText: 'Email',
                    //                     labelStyle: TextStyle(
                    //                         fontFamily: 'Montserrat',
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.grey,
                    //                     ),
                    //                     focusedBorder: UnderlineInputBorder(
                    //                         borderSide: borderSide(color: Colors.green),
                    //                     )
                    //                 ),
                    //             ),
                    //         ]
                    //     ),
                    //     // child: Text("Hello",
                    //     // style: TextStyle(
                    //     //     fontSize: 40, fontWeight: FontWeight.bold
                    //     // )),
                    // ),

                ],
            ),
         ),
    //   body: Center(
    //     // Center is a layout widget. It takes a single child and positions it
    //     // in the middle of the parent.
    //     child: Column(
        
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times lkasjdflkjasd:', style: TextStyle(fontSize: 40),
    //         ),
           
    //       ],
    //     ),
    //   ),


      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}