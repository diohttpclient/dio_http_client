import 'package:dartz/dartz.dart';
import 'package:dio_http_client/network/app_http_client.dart';
import 'package:dio_http_client/network/error_response.dart';
import 'package:dio_http_client/network/success_response.dart';
import 'package:dio_http_client/repository/remote_repository.dart';

abstract class TestRepository extends RemoteRepository {
  TestRepository(AppHttpClient remoteDataSource) : super(remoteDataSource);

  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testGet(
      {bool? cached, bool? forceRefresh});
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>>
      testDelete({bool? cached, bool? forceRefresh});
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>>
      testPatch({bool? cached, bool? forceRefresh});
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testPost(
      {bool? cached, bool? forceRefresh});
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testPut(
      {bool? cached, bool? forceRefresh});
}
