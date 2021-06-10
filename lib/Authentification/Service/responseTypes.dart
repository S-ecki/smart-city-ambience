enum EFireBaseSignInResponse { Success, Failed }

class FireBaseSignInResponse {
  EFireBaseSignInResponse enumResponse;
  String errorMessage;

  FireBaseSignInResponse({this.enumResponse, this.errorMessage});
}