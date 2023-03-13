// ignore_for_file: unnecessary_overrides

import '../model/base_enum.dart';

class RestMethod extends BaseEnum<String> {
  const RestMethod._(String rawValue) : super(rawValue);

  static RestMethod get = const RestMethod._('GET');
  static RestMethod post = const RestMethod._('POST');
  static RestMethod patch = const RestMethod._('PATCH');
  static RestMethod put = const RestMethod._('PUT');
  static RestMethod delete = const RestMethod._('DELETE');

  @override
  bool operator ==(Object other) {
    if (other is RestMethod) {
      return other.rawValue == rawValue;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => super.hashCode;
}
