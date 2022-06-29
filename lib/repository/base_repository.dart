import 'package:flutter/cupertino.dart';

import '../source/base_data_source.dart';

abstract class BaseRepository {
  @protected
  final BaseDataSource dataSource;

  BaseRepository(this.dataSource);
}
