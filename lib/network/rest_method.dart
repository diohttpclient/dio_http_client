import '../model/base_enum.dart';

class RestMethod extends BaseEnum<String> {
  const RestMethod._(String rawValue) : super(rawValue);

  static RestMethod get = RestMethod._('GET');
  static RestMethod post = RestMethod._('POST');
  static RestMethod patch = RestMethod._('PATCH');
  static RestMethod put = RestMethod._('PUT');
  static RestMethod delete = RestMethod._('DELETE');

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
