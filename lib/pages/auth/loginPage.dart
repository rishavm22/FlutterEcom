import 'package:ecom_demo/Utilities/authHelper.dart';
import 'package:ecom_demo/Utilities/btns.dart';
import 'package:ecom_demo/pages/auth/regPage.dart';
import 'package:ecom_demo/providers/statusProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'forgetPage.dart';

class LoginPage extends StatefulWidget {
  static final String id = "log";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Consumer<StatusProvider>(
              builder: (BuildContext context, data, Widget? child) {
                return FormBuilder(
                  key: loginKey,
                  child: Center(
                    child: Container(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height *0.01,
                          ),
                          Hero(
                            tag: 'logo',
                            child: Container(
                              height: 200,
                              child:
                              Image.asset('assets/images/logo.png'),
                            ),
                          ), // App Logo
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          loadingBox(data),
                          FormBuilderTextField(
                            name: 'email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            enableInteractiveSelection: true,
                            textAlign: TextAlign.center,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.email(context,
                                  errorText: 'Enter valid email'),
                              FormBuilderValidators.required(context,
                                  errorText: 'Please enter email'),
                                  (val) {
                                return null;
                              }
                            ]),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.blue,),
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              labelText: 'Email',
                            ),
                          ),
                          // email
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          FormBuilderTextField(
                            name: 'password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                            obscureText: !data.getPasswordVisibility,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.minLength(context, 6,
                                  errorText: 'Minimum 6 Character'),
                              FormBuilderValidators.maxLength(context, 12,
                                  errorText: 'Maximum 12 Character'),
                              FormBuilderValidators.required(context,
                                  errorText: 'Please enter password'),
                                  (val) {
                                return null;
                              }
                            ]),
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              prefixIcon: Icon(
                                Icons.security,
                                color: Colors.blue.shade900,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: data.getPasswordVisibility
                                      ? Colors.blue
                                      : Colors.grey.shade900,
                                ),
                                onPressed: () => data.setPasswordVisibility(),
                              ),
                            ),
                          ),
                          // password
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextBoxBtnWidget(
                                textBoxColor: Colors.lightBlueAccent,
                                textColor: Colors.white,
                                label: 'Log In',
                                onPressedBtn: () async {
                                  String email, pass;
                                  if (loginKey.currentState!.validate()) {
                                    loginKey.currentState!.save();
                                    email = loginKey.currentState!.value['email'];
                                    pass = loginKey.currentState!.value['password'];
                                    data.setLoadingStatus(true);
                                    signInWithEmailAndPassword(
                                        email, pass, context);
                                    data.setLoadingStatus(false);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                        "Please enter valid email and password",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  }
                                },
                              ),
                              TextBoxBtnWidget(
                                textBoxColor: Colors.lightBlueAccent,
                                textColor: Colors.white,
                                label: 'Registration',
                                onPressedBtn: () async {
                                  Navigator.pushNamed(
                                      context, RegistrationPage.id);
                                },
                              ), //Registration Btn
                            ],
                          ),
                          TextBoxBtnWidget(
                            textBoxColor: Colors.lightBlueAccent,
                            textColor: Colors.white,
                            label: 'Forgot Password',
                            onPressedBtn: () async {
                              Navigator.pushNamed(context, ForgetPage.id);
                            },
                          ), // Forgot Password Button
                          GestureDetector(
                            onTap: () {
                              try {
                                data.setLoadingStatus(true);
                                googleLogin(context);
                              } catch (e) {
                                data.setLoadingStatus(false);
                              }
                              data.setLoadingStatus(false);
                            },
                            child: Center(
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width / 22),
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.shade700,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image:
                                    AssetImage('assets/images/googleBtn.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                                ),
                              ),
                            ),
                          ) // Google Login Button
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget loadingBox(StatusProvider data) {
    return data.getLoadingStatus
        ? Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    )
        : Container();
  }



}
