import 'package:clean_archeticture_movies/core/network/error_message_model.dart';

class serverException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const serverException({required this.errorMessageModel});
}

// اذا بدي استخدم الوكال فيما بعد وانا حر مرق شو ما بدي فوق مرقت موديل لانو هو عبارة عن ثلاث عناصر
class LocalDataBaseException implements Exception {
  final String message;

  const LocalDataBaseException({required this.message});
}
