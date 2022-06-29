abstract class BaseDataSource<K> {
  Future retrieveData<T>(K request);
}
