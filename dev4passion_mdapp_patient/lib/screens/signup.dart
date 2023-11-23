import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    late bool _success;
    late String? _userEmail;


    void _register() async {
                final User? user = (await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)).user;
                print(_emailController.text);
                print(_passwordController.text);

                if ( user != null) {
                    setState(() {
                        _success = true;
                        _userEmail = user.email;
                    });

                } else {
                    _success = false;
                }

    //              if (user != null) {
    //         setState(() {
    //             _success = true;
    //             _userEmail = user.email
    //         }};
    // } else {
    //     setState(() {
    //         _success = false;
    //     }};
        
    }

    // void register() async {
    //     final User user = (await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).user);

    //     if (user != null) {
    //         setState(() {
    //             _success = true;
    //             _userEmail = user.email
    //         }};
    // } else {
    //     setState(() {
    //         _success = false;
    //     }};
    // }
    


  @override
  Widget build(BuildContext context) {
    // return Container(
      
    // );
    return new Scaffold(
        // body: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,

        // )

        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(15,110,0,0),
                        child: Text("SignUp",
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

                                //  Container(
                                //     alignment: Alignment(1,0),
                                //     padding: EdgeInsets.only(top:15, left:20),
                                //     child: InkWell(
                                //         child: Text(
                                //             'Forgot Password',
                                //             style: TextStyle(
                                //                 color: Colors.black,
                                //                 fontWeight: FontWeight.bold,
                                //                 fontFamily: 'Montserrat',
                                //                 decoration: TextDecoration.underline,
                                //             ),
                                //         ),

                                //     ),
                                //  ),

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

                                                _register();
                                            },
                                            child: Center(
                                                child: Text(
                                                    'Register',
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
                                                // Navigator.of(context).pushNamed('/signup');
                                                 Navigator.of(context).pop();
                                            },
                                                child: Text(
                                                    'back to Login',
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
            ]

        )



        

       

    );
  }
}