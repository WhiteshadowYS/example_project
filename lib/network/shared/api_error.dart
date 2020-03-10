enum APIErrorType {
  UnknownError,
  ConnectionError,
  httpError,
  parsingError,
  InvalidPersonalId,
  InvalidCode,
  InvalidUser,
  InvalidFlightId,
  InvalidRefundId,
  InvalidPushToken,
  FireBaseError,
}

class APIError {
  final String readableError;
  final int errorCode;
  final APIErrorType type;

  APIError({this.readableError, this.errorCode, this.type});

  // TODO: lang! (use error keys)

  static APIError get noConnectionToServerError {
    return APIError(readableError: 'לא ניתן להתחבר לשרת', errorCode: -2000, type: APIErrorType.ConnectionError);
  }

  static APIError get unknownError {
    return APIError(readableError: 'שגיאה לא ידועה', errorCode: -1, type: APIErrorType.UnknownError);
  }

  static APIError get invalidPersonalId {
    return APIError(readableError: 'מספר אישי שגוי', errorCode: 1001, type: APIErrorType.InvalidPersonalId);
  }

  static APIError get invalidCode {
    return APIError(readableError: 'קוד שגוי', errorCode: 1002, type: APIErrorType.InvalidCode);
  }

  static APIError get invalidUser {
    return APIError(readableError: 'משתמש לא תקין', errorCode: 1003, type: APIErrorType.InvalidUser);
  }

  static APIError get invalidPushToken {
    return APIError(readableError: 'בעיה באסימון התראות', errorCode: 1004, type: APIErrorType.InvalidPushToken);
  }

  static APIError getErrorByCode(int code) {
    switch (code) {
      case 1001:
        return invalidPersonalId;
      case 1002:
        return invalidCode;
      case 1003:
        return invalidUser;
      case 1004:
        return invalidPushToken;
      default:
        return unknownError;
    }
  }

  static APIError getHttpError(int code, String message) {
    return APIError(readableError: message, errorCode: code, type: APIErrorType.httpError);
  }

  static APIError getParsingError(String message) {
    return APIError(readableError: message, errorCode: 0, type: APIErrorType.parsingError);
  }

  static APIError getFireBaseError(String code, String message) {
    return APIError(readableError: message, errorCode: -2, type: APIErrorType.FireBaseError);
  }

  static APIError getOtherError(String message) {
    return APIError(readableError: message, errorCode: -1000, type: APIErrorType.UnknownError);
  }
}
