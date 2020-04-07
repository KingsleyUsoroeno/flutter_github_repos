import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/core/services/authenticator.dart';
import 'package:provider_architecture/core/viewmodel/login_view_model.dart';
import 'package:provider_architecture/core/viewstate.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LoginHeader(
                controller: controller,
                validationMessage: model.errorMessage,
              ),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                  color: Colors.white,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    var loginSuccess = await model.login(controller.text);
                    if (loginSuccess) {
                      // Navigate to the home view
                      print("loginSuccess was $loginSuccess");
                      Navigator.pushReplacementNamed(context, '/'); // will take us to the home page
                    }
                  })
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    locator<AuthenticationService>().dispose();
    super.dispose();
  }
}
