// ignore_for_file: prefer_const_constructors, unused_local_variable, import_of_legacy_library_into_null_safe, prefer_const_declarations, avoid_print, use_key_in_widget_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:myhands/http_service.dart';

//final String urlRoute = "https://43d3-31-204-181-129.ngrok.io/users/";
//String login, String pwd

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final HttpService httpService = HttpService();

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  final controllerLogin = TextEditingController();
  final controllerPwd = TextEditingController();

  @override
  void dispose() {
    controllerLogin.dispose();
    super.dispose();
  }

  void signIn() {
    var login = controllerLogin.text;
    var pwd = controllerPwd.text;
    print(login + " " + pwd);
  }

  bool isChecked = false;
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    final loginField = TextFormField(
        controller: controllerLogin,
        autofocus: false,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.login),
            color: Colors.grey,
            onPressed: () {},
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: "Логин",
          hintStyle: TextStyle(fontSize: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color.fromRGBO(88, 88, 88, 1.0), width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color.fromRGBO(88, 88, 88, 1.0), width: 2.0)),
          fillColor: Colors.white12,
          enabled: true,
        ));
    final passwordField = TextFormField(
        controller: controllerPwd,
        autofocus: false,
        textAlign: TextAlign.start,
        obscureText: _isHidden,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            color: Colors.grey,
            icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isHidden = !_isHidden;
              });
            },
          ),
          //InkWell(onTap: togglePasswordShow, child: Icon(Icons.visibility)),
          contentPadding: EdgeInsets.all(10),
          hintText: 'Пароль',
          hintStyle: TextStyle(fontSize: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color.fromRGBO(88, 88, 88, 1.0), width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color.fromRGBO(88, 88, 88, 1.0), width: 2.0)),
          fillColor: Colors.white12,
          enabled: true,
        ));
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(72, 206, 102, 1.0),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            httpService.getUser(
                controllerLogin.text, controllerPwd.text, context);
          },
          child: Text("Войти",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
    );
    final checkBoxStayInSystem = ListTileTheme(
        //contentPadding: EdgeInsets.all(0),
        child: Row(children: <Widget>[
      Expanded(
        child: CheckboxListTile(
            contentPadding: EdgeInsets.all(0.0),
            title: Text("Показать пароль"),
            value: isChecked,
            selected: isChecked,
            activeColor: Colors.green,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool checked) {
              setState(() {
                isChecked = checked;
              });
            }),
      )
    ]));

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 210,
                          child: Image.asset("assets/logo.jpg",
                              fit: BoxFit.contain)),
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: loginField),

                      SizedBox(height: 10),
                      passwordField,
                      SizedBox(height: 15),
                      loginButton,
                      SizedBox(height: 10),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )));
  }

  void togglePasswordShow() {
    setState(() {
      _isHidden != _isHidden;
    });
  }
}
