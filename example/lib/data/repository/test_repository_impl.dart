import 'package:dartz/dartz.dart';
import 'package:dio_http_client/network/app_http_client.dart';
import 'package:dio_http_client/network/error_response.dart';
import 'package:dio_http_client/network/success_response.dart';
import 'package:dio_http_client_example/data/repository/response/test_get_response.dart';
import 'package:dio_http_client_example/data/repository/test_repository.dart';

import 'request/test_delete_request.dart';
import 'request/test_get_request.dart';
import 'request/test_patch_request.dart';
import 'request/test_post_request.dart';
import 'request/test_put_request.dart';
import 'response/test_delete_response.dart';
import 'response/test_patch_response.dart';
import 'response/test_post_response.dart';
import 'response/test_put_response.dart';

class TestRepositoryImpl extends TestRepository {
  TestRepositoryImpl(AppHttpClient remoteDataSource) : super(remoteDataSource);

  @override
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>>
      testDelete({bool? cached, bool? forceRefresh}) async {
    final response = await dataSource.retrieveData<TestDeleteResponse>(
      TestDeleteRequest(),
      cached: cached,
      forceRefresh: forceRefresh,
      
    );

    return response.fold(
        (error) => Left(error),
        (success) => Right(
            SuccessResponse(success.statusCode, success.data.body ?? {})));
  }

  @override
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testGet(
      {bool? cached, bool? forceRefresh}) async {
    final response = await dataSource.retrieveData<TestGetResponse>(
      TestGetRequest(),
      cached: cached,
      forceRefresh: forceRefresh,
    );

    return response.fold(
        (error) => Left(error),
        (success) => Right(
            SuccessResponse(success.statusCode, success.data.body ?? {})));
  }

  @override
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>>
      testPatch({bool? cached, bool? forceRefresh}) async {
    final response = await dataSource.retrieveData<TestPatchResponse>(
      TestPatchRequest(),
      cached: cached,
      forceRefresh: forceRefresh,
    );

    return response.fold(
        (error) => Left(error),
        (success) => Right(
            SuccessResponse(success.statusCode, success.data.body ?? {})));
  }

  @override
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testPost(
      {bool? cached, bool? forceRefresh}) async {
    final response = await dataSource.retrieveData<TestPostResponse>(
      TestPostRequest(),
      cached: cached,
      forceRefresh: forceRefresh,
    );

    return response.fold(
        (error) => Left(error),
        (success) => Right(
            SuccessResponse(success.statusCode, success.data.body ?? {})));
  }

  @override
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testPut(
      {bool? cached, bool? forceRefresh}) async {
    final response = await dataSource.retrieveData<TestPutResponse>(
      TestPutRequest(),
      cached: cached,
      forceRefresh: forceRefresh,
    );

    return response.fold(
        (error) => Left(error),
        (success) => Right(
            SuccessResponse(success.statusCode, success.data.body ?? {})));
  }
}
