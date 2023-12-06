import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:email_validator/email_validator.dart';

// import 'package:firebase_auth_forgot_password/utils.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({ Key? key }) : super(key: key);

  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    late bool _success;
    late String? _userEmail;

    Future resetPassword() async {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.toString());
    }



  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        // body: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,

        // )

        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(15,110,0,0),
                        child: Text("Reset password",
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

                                               // _register();
                                               print(_emailController.text.toString());

                                               //FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.toString());
                                                resetPassword();

                                              //print("ttttttt");
                                            },
                                            child: Center(
                                                child: Text(
                                                    'Reset password',
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
    
    
    // return Container(
      
    // );
  }
}