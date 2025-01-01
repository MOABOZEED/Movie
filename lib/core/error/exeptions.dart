import 'package:movie/core/network/error_massege.dart';

class ServerException implements Exception{
  final ErrorMassageModel errorMassageModel;

 const ServerException({required this.errorMassageModel});
}