class ServerExecption implements Exception {
  final String message;

  ServerExecption({this.message = 'Server error occured, please check the datasources'});
}
