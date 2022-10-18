import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final String statusCode;
  final String statusMessage;

 const ErrorMessageModel(
      {required this.success,
      required this.statusCode,
      required this.statusMessage});

  factory ErrorMessageModel.formJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status_code"],
      success: json["false"],
      statusMessage: json["status_message"],
    );
  }

  @override
  List<Object?> get props => [statusCode, success, statusMessage];
}
