import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';
import 'package:provider_architecture/core/enums/viewState.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
          builder: (context, model, child) => Scaffold(
                //We'll wrap the scaffold in a Provider and we'll make the child of the Provider a consumer that returns the Scaffold as it's builder child.
                backgroundColor: backgroundColor,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LoginHeader(
                        validationMessage: model.errorMessage,
                        controller: _controller),
                    model.state == viewState.Busy
                        ? CircularProgressIndicator()
                        : FlatButton(
                            color: Colors.white,
                            onPressed: () async {
                              var loginUser =
                                  await model.login(_controller.text);
                              if (loginUser) {
                                //NAVIGATE TO THE HOME VIEW
                                Navigator.pushNamed(context, '/');
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                  ],
                ),
              ));
  }
}
