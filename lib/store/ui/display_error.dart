import 'package:meta/meta.dart';

class ErrorDisplay {
  final String message;

  final Function action;

  final bool isIcon;

  ErrorDisplay({@required this.message, this.action, this.isIcon = false});
}
