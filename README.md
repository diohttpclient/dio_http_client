# dio_http_client

Advanced client for [dio]

This library currently supports also Authentication token and cache system with [dio_http_cache]

### Add dependencies
This dependency needs also [dio_http_cache] and [dartz] to work. 
```yaml
dependencies:
  dio: ^4.0.x  #latest version
  dio_http_client: ^0.0.x #latest version
  dio_http_cache: ^0.3.x #latest version
  dartz: ^0.10.x #latest version
```
## Data Structure
We advise using a structure like the following
```
data/
|-request/
|-response/
|-name_repository_impl.dart
|-name_repository.dart
```
In the request directory, there will be a class for each request

In the response directory, there will be a class for each response


# Simple example
#### TestGetRequest
```dart
class TestGetRequest extends ApiRequest {
  TestGetRequest()
      : super(
            baseUrl: Constants.domain, //Your domain
            endPoint: "${Constants.getEndpoint}?key=value", //Your endpoint
            method: RestMethod.get, //Request method
            decoder: (data) =>
                TestGetResponse.fromMap(Map<String, dynamic>.from(data))); //Decoder of the response
}
```
#### TestGetResponse
```dart
class TestGetResponse extends ApiResponse<Map<String, dynamic>> {
  TestGetResponse._( //Private Constructor
      {Map<String, dynamic>? body, String? message, String? result}) //The type of body is your desirable type that you will need to put also in the repository
      : super(body: body, message: message, result: result);

  factory TestGetResponse.fromMap(Map<String, dynamic> data) {
    return TestGetResponse._(body: data["args"]);
  }
}
```
#### TestRepository
```dart
abstract class TestRepository extends RemoteRepository {
  TestRepository(AppHttpClient remoteDataSource) : super(remoteDataSource);

  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testGet( //Change the type of SuccessResponse to you desirable type
      {bool? cached, bool? forceRefresh}); //set cached to true if you would like to cache your response. Set forceRefresh to true if you want to refresh your cached response. Leave blank if you don't want to cache
}
```
#### TestRepositoryImpl
```dart
class TestRepositoryImpl extends TestRepository {
  TestRepositoryImpl(AppHttpClient remoteDataSource) : super(remoteDataSource);
  
  @override
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testGet(
      {bool? cached, bool? forceRefresh}) async {
    final response = await dataSource.retrieveData<TestGetResponse>( //Set your response as return type
      TestGetRequest(),
      cached: cached,
      forceRefresh: forceRefresh,
    );

    return response.fold(
        (error) => Left(error),
        (success) => Right(
            SuccessResponse(success.statusCode, success.data.body ?? {})));
  }
```

### Interceptors
#### LoggingInterceptor
This is for logging in the console all requests and responses

You can create your own Interceptor and attach it to the client

### QuickStart

1. Initialize the client:

   ```dart
    AppHttpClient client = AppHttpClient(debug: true, interceptors: [ //Add all the interceptor that you need
      LoggingInterceptor(),
      DioCacheManager(CacheConfig(baseUrl: "https://www.google.it")).interceptor //Add this interceptor if you want to cache your app
    ],
    requestReceiveTimeout: 3600, //Global receive timeout
    requestSendTimeout: 3600, //Global send timeout
    );
   ```

2. Initialize repositories:

   ```dart
   TestRepository testRepository = TestRepositoryImpl(client);
    ```
3. Make requests:

   ```dart
   final response = await testRepository.testGet();
    ```
    
### Update Autorization Token
To update the authorization token you can call 
```dart
  client.updateToken(token);
```
We advise using [get_it] as a dependency injection to manage your instances.

## Request class
When you create your request class, you need to extend ```ApiRequest```

Add override methods only if you need them
```dart
class TestGetRequest extends ApiRequest {
  TestGetRequest()
      : super(
            toekn: //Authorization token,
            userEmail: //User email,
            baseUrl: //Your domain,
            endPoint: //Your endpoint,
            method: //Request method (RestMethod. get, post, patch, put, delete),
            decoder: (data) => //Decoder of the response,
  );
                
  @override
  //Request body
  Map<String, dynamic> get body => super.body;

  @override
  //QueryParameters
  Map<String, dynamic> get queryParameters => super.queryParameters;

  @override
  // Dio response type. Default is ResponseType.json
  ResponseType get responseType => super.responseType;

  @override
  //Default is 36000 milliseconds
  int get receiveTimeout => super.receiveTimeout;

  @override
  //Default is 36000 milliseconds
  int get sendTimeout => super.sendTimeout;
}
```
## Response class
When you create your response class you need to extend ```ApiResponse```
```dart
class TestGetResponse extends ApiResponse<Map<String, dynamic>> {
  TestGetResponse._({
    Map<String, dynamic>? body,
    String? message,
    String? result,
  }) : super(
          body: body,
          message: message,
          result: result,
        );

  factory TestGetResponse.fromMap(Map<String, dynamic> data) { //The decoder needs to call the factory method
    return TestGetResponse._(body: data["args"]);
  }
}
```
## RepositoryImpl class
```dart
class TestRepositoryImpl extends TestRepository { //extends abstract repository
  TestRepositoryImpl(AppHttpClient remoteDataSource) : super(remoteDataSource);
  
  @override
  Future<Either<ErrorResponse, SuccessResponse<Map<String, dynamic>>>> testGet(
      {bool? cached, bool? forceRefresh}) async {
    final response = await dataSource.retrieveData<TestGetResponse>( //Set your response as return type
      TestGetRequest(),
      cached: cached, // true if you want to cache the response
      forceRefresh: forceRefresh, // true if you want to refresh the cache
      duration: Duration(days: 1) // Set the cache duration, default is 7 days
    );
    
    //Return the correct response
    return response.fold(
        (error) => Left(error),
        (success) => Right(
            SuccessResponse(success.statusCode, success.data.body ?? {})));
  }
```

### Cache
Available only for Android, Ios and MacOs

For further management of your app cache, consult [dio_http_cache]

## License

MIT License

Copyright (c) 2022 diohttpclient@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[dio]: <https://pub.dev/packages/dio> 
[dio_http_cache]: <https://pub.dev/packages/dio_http_cache>
[dartz]: <https://pub.dev/packages/dartz>
[get_it]: <https://pub.dev/packages/get_it>
