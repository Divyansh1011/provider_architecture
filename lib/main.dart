import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/authenticationservice.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/routes.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        initialData: User.initial(),//Set the initial data by the user model for the stream controller 
        create: (context) => locator<AuthenticationService>().userController.stream,
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/login',
        onGenerateRoute: Router
            .generateRoute, //Navigation done through routes creating a route page for the naviagtion
      ),
    );
  }
}
