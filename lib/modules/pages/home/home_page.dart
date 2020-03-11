import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:example_project/modules/layouts/main_layout.dart';
import 'package:example_project/modules/shared/widgets/global_button.dart';
import 'package:example_project/modules/pages/home/home_page_converter.dart';
import 'package:example_project/modules/pages/home/home_page_view_model.dart';

import 'package:example_project/dictionary/dictionary.dart';

class HomePage extends StatelessWidget {

  void signOut(HomePageViewModel viewModel) {
    viewModel.signout();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: homePageConverter,
      builder: (BuildContext context, HomePageViewModel viewModel) {
        return MainLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GlobalButton(
                onPressed: () => signOut(viewModel),
                text: FlutterDictionary.of(context).getHomePageSignOut,
              ),
            ],
          ),
        );
      }
    );
  }
}
