import 'package:clean_archeticture_movies/movies/presntaion/components/widget.dart';
import 'package:clean_archeticture_movies/movies/presntaion/controller/bloc_sign_in_out/sign_in_out_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/text_field_coustum.dart';

class SignUpScreen extends StatelessWidget {
  static String id = "sigUpScreen";

  GlobalKey<FormState> formKey = GlobalKey();
  bool isloading = false;

  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  TextEditingController nameEditingController = TextEditingController();

  TextEditingController numberPhoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInOutBloc, SignInOutState>(
      listener: (context, state) {
        if (state is SignOutloading) {
          isloading = true;
        } else if (state is SignOutSuccess) {
          Navigator.pop(context);
          isloading = false;
        } else if (state is SignOutFailure) {
          scaffoldMessenger(context, state.erorrMessage);
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: false,
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade600,
                      Color(00000),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.mirror),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 100, 10, 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        image("assets/images/logo2.gif", 200, 200),
                        SizedBox(
                          height: 30,
                        ),
                        // resubleTextField(
                        //     onchanged: (data) {},
                        //     text: "Enter Your Name",
                        //     isPassWordType: false,
                        //     controller: nameEditingController,
                        //     iconData: Icons.person_add_alt_sharp),
                        SizedBox(
                          height: 15,
                        ),
                        resubleTextField(
                          onchanged: (data) {},
                          isPassWordType: false,
                          text: "Enter Your Email",
                          iconData: Icons.mail,
                          controller: emailEditingController,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        resubleTextField(
                          text: "Enter Your password",
                          isPassWordType: true,
                          controller: passwordEditingController,
                          iconData: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // resubleTextField(
                        //   onchanged: (data) {},
                        //   text: "Enter Your phone Number",
                        //   isPassWordType: false,
                        //   controller: numberPhoneEditingController,
                        //   iconData: Icons.phone,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90)),
                          child: ElevatedButton(
                              child: Text(
                                "SIGN OUT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.grey;
                                  } else {
                                    return Color.fromARGB(255, 48, 45, 45);
                                  }
                                }),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<SignInOutBloc>(context).add(
                                    SignOutEvent(
                                        email: emailEditingController.text,
                                        password:
                                            passwordEditingController.text),
                                  );
                                }
                              }),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You have acconts?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: (() async {
                                Navigator.pop(context);
                              }),
                              child: Text(
                                "Sing in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void scaffoldMessenger(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
