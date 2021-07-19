import 'package:ecom_demo/Utilities/authHelper.dart';
import 'package:ecom_demo/providers/statusProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  static final String id = "reg";

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopNow'),
      ),
      backgroundColor: Color(0xFFA1B5FF),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 250, 24, 0),
          child: Center(
            child: FormBuilder(
              key: _formKey,
              child: Container(
                width: 350,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Consumer<StatusProvider>(
                        builder: (BuildContext context, data, Widget? child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
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
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.blue,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
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
                                  hintText: "Enter your Pass",
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
                              FormBuilderTextField(
                                name: 'confirm_password',
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  suffixIcon: (_formKey.currentState != null &&
                                      !(_formKey
                                          .currentState
                                          ?.fields['confirm_password']
                                          ?.isValid ??
                                          false))
                                      ? const Icon(Icons.error, color: Colors.red)
                                      : const Icon(Icons.check, color: Colors.green),
                                ),
                                obscureText: true,
                                validator: FormBuilderValidators.compose([
                                      (val) {
                                    if (val !=
                                        _formKey.currentState?.fields['password']
                                            ?.value) {
                                      return 'Passwords Not Match';
                                    }
                                    return null;
                                  }
                                ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20.0, bottom: 20),
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF01155B),
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      String email = _formKey.currentState!.value['email'];
                                      String pass = _formKey.currentState!.value['password'];
                                      print(email);
                                      register(
                                        email,
                                        pass,
                                        context,
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20.0, bottom: 20),
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF01155B),
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Login Page',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
