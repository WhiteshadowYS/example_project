import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:example_project/modules/layouts/main_layout.dart';
import 'package:example_project/modules/shared/widgets/global_button.dart';
import 'package:example_project/modules/shared/widgets/login_text_field.dart';
import 'package:example_project/modules/pages/login/login_page_converter.dart';
import 'package:example_project/modules/pages/login/login_page_view_model.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:example_project/theme/colors.dart';
import 'package:example_project/dictionary/dictionary.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController     = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();

  void loginFunction(LoginPageViewModel viewModel) {
    viewModel.login(
      emailController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: loginPageConverter,
      builder: (BuildContext context, LoginPageViewModel viewModel) {
        return MainLayout(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  FlutterDictionary.of(context).getLoginPageTitle,
                  style: GoogleFonts.montserrat(
                    fontSize:   48,
                    color:      black.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 32),
              LoginTextField(
                controller: emailController,
                hintText:   FlutterDictionary.of(context).getLoginPageEmailHint,
              ),
              LoginTextField(
                controller: passwordController,
                hintText:   FlutterDictionary.of(context).getLoginPagePasswordHint,
              ),
              GlobalButton(
                text: FlutterDictionary.of(context).getLoginPageSignInButton,
                onPressed: () => loginFunction(viewModel),
              ),
            ],
          ),
        );
      }
    );
  }
}
