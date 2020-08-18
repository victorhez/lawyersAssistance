import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _forgetPasswordVisible = true;
  bool _signInButtonVisible = true;
  bool _nameVisible = false;
  bool _confirmpassVisible = false;
  bool _roleVisible = false;
  bool _forgetPassword = false;
  bool _logInButtonVisible = true;
  Color _signUpColor = Color(0xffCAD3C8);
  Color _loginColor = Color(0xff0652DD);
  Color _loginTextColor = Colors.white;
  String _selectedRole;
  String _pass;
  final _formKey = GlobalKey<FormState>();
  List<String> _roles = ["Barrister", " Lawyer", "SAN"];
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmController = new TextEditingController();
  String _role;
  Widget currentWidget;
  Widget current() {
    return currentWidget;
  }
  Widget _loginWidget() {
    return Visibility(
      visible: _logInButtonVisible,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _forgetPasswordVisible = true;
            _confirmpassVisible = false;
            _nameVisible = false;
            _roleVisible = false;
            _loginColor = Color(0xff0652DD);
            _signUpColor = Color(0xffCAD3C8);
          });
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: _loginColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, color: _loginTextColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signWidget() {
    return Visibility(
      visible: _signInButtonVisible,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _loginWidget()= _signWidget();
            _confirmpassVisible = true;
            _nameVisible = true;
            _roleVisible = true;
            _forgetPassword = false;
            _signUpColor = Color(0xff0652DD);
            _loginColor = Color(0xffCAD3C8);
          });
          if (_formKey.currentState.validate()) {
            _logInButtonVisible = false;
          }
        },
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: _signUpColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3742fa),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/icon1.jpg"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(0),
                child: Center(
                    child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Visibility(
                              visible: _nameVisible,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2, right: 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff1f2f6),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: TextFormField(
                                    controller: _nameController,
                                    validator: (value) {
                                      if (value.length <= 2) {
                                        return "Add a valid Name";
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.person,
                                          color: Color(0xff3742fa),
                                        ),
                                        border: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        labelText: "Name"),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 2, right: 2, top: 30),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xfff1f2f6),
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextFormField(
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value.length <= 2) {
                                      return "Add a valid Email";
                                    }
                                    if (!value.contains("@")) {
                                      return "Add a valid Email";
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.alternate_email,
                                        color: Color(0xff3742fa),
                                      ),
                                      border: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      labelText: "Email"),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _roleVisible,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 2, right: 2, top: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff1f2f6),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: DropdownButton(
                                        hint: Text("Role"),
                                        value: _selectedRole,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedRole = value;
                                          });
                                        },
                                        items: _roles.map((location) {
                                          return DropdownMenuItem(
                                            child: Text(location),
                                            value: location,
                                          );
                                        }).toList(),
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 2, right: 2, top: 30),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xfff1f2f6),
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextFormField(
                                  onSaved: (val) {
                                    _pass = val;
                                  },
                                  validator: (value) {
                                    if (value.length <= 5) {
                                      return "Password must be up to 6 characters";
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.lock,
                                        color: Color(0xff3742fa),
                                      ),
                                      border: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      labelText: "Password"),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _confirmpassVisible,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 2, right: 2, top: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff1f2f6),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.length <= 5) {
                                        return "Password must be up to 6 characters";
                                      }
                                      if (value != _pass) {
                                        return "Password not the same";
                                      }
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.lock,
                                          color: Color(0xff3742fa),
                                        ),
                                        border: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        labelText: "Confirm"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Visibility(
                              visible: _forgetPassword,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AnimatedSwitcher(
                              duration: Duration(seconds: 1),
                              child: _loginWidget(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _signWidget(),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
