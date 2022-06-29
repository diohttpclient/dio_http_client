import 'package:dio_http_client/network/app_http_client.dart';
import 'package:flutter/cupertino.dart';

import '../network/base_http_client.dart';
import 'base_repository.dart';

abstract class RemoteRepository extends BaseRepository {
  RemoteRepository(AppHttpClient remoteDataSource) : super(remoteDataSource);

  @override
  @protected
  BaseHttpClient get dataSource => super.dataSource as BaseHttpClient;
}
