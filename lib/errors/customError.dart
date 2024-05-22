class CustomError extends Error {
  final String message;

  CustomError({required this.message});

  String getError(){
    return message;
  }
}
