import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/localization/app_translate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../controllers/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Seu Email",
                ),
              ),
              SizedBox(height: _height * 0.02,),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: "Seu Senha",
                ),
                obscureText: true,
              ),
              SizedBox(height: _height * 0.06,),

              RaisedButton(
              onPressed: (){},
              child: Text(AppTranslate(context).text('intro.login_now'),
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
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
