import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:example_project/dictionary/dictionary.dart';
import 'package:example_project/theme/app_theme.dart';

import 'package:example_project/modules/pages/home/home_page.dart';
import 'package:example_project/modules/pages/login/login_page.dart';
import 'package:example_project/modules/support/page_not_found.dart';
import 'package:example_project/modules/support/splash_screen/splash_screen.dart';

import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/initialize/initialize_actions.dart';
import 'package:example_project/utils/consts.dart';
import 'package:example_project/utils/pop_navigator_observer.dart';
import 'package:example_project/utils/route_types.dart';

class Application extends StatefulWidget {
  final Store<AppState> store;

  Application({Key key, @required this.store}) : super(key: key);

  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  // region [Init]
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() => widget.store.dispatch(StartInitialization());
  // endregion

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    PopNavigatorObserver observer = new PopNavigatorObserver();
    observer.setOnPop((Route route, Route previousRoute) {
      ///place any code you want to globally react to pop navigation events.

    });
    print('[Application] => [build] => [BUILD MATERIAL LOCALE] => ${widget.store.state.ui.locale}');
    /// [StoreProvider] is used to pass the store to the [StoreConnectors]
    /// down the widget tree.
    return StoreProvider<AppState>(
        store: widget.store,
        child: StoreConnector<AppState,AppState>(
          converter: (store) => store.state,
          builder: (context, store) {
            return MaterialApp(
              theme: appTheme,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                const FlutterDictionaryDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              locale: store.ui.locale,
              supportedLocales: [
                const Locale('en'),
              ],
              navigatorKey: NavigatorHolder.navigatorKey,
              navigatorObservers: <NavigatorObserver>[
                observer
              ],
              onGenerateRoute: (RouteSettings settings) => onGenerateRoute(settings),
              home: SplashScreenPage(),
            );
          },
        )
    );
  }

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case ROUTE_HOME_PAGE:
        return RouteType.defaultRoute(
          settings: settings,
          page: HomePage()
        );

      case ROUTE_LOGIN_PAGE:
        return RouteType.defaultRoute(
            settings: settings,
            page: LoginPage()
        );

      case ROUTE_SPLASH_SCREEN:
        return RouteType.defaultRoute(
          settings: settings,
          page: SplashScreenPage()
        );

    // region [DEFAULT]
      default:
        return RouteType.defaultRoute(
          settings: settings,
          page: PageNotFound()
        );
    // endregion
    }
  }
}
