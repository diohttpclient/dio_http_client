import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio_http_client/interceptors/error_interceptor.dart';
import 'package:dio_http_client/interceptors/logging_interceptor.dart';
import 'package:dio_http_client/network/app_http_client.dart';
import 'package:flutter/material.dart';

import 'costants.dart';
import 'data/repository/test_repository.dart';
import 'data/repository/test_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppHttpClient client;
  late TestRepository testRepository;

  @override
  void initState() {
    super.initState();
    client = AppHttpClient(
        debug: true,
        interceptors: [
          LoggingInterceptor(),
          ErrorInterceptor(),
          DioCacheManager(CacheConfig(baseUrl: Constants.domain)).interceptor
        ],
        requestReceiveTimeout: 3600,
        requestSendTimeout: 3600);
    testRepository = TestRepositoryImpl(client);
  }

  String getMessage = '';
  String deleteMessage = '';
  String patchMessage = '';
  String postMessage = '';
  String putMessage = '';

  void _testGet() async {
    final response = await testRepository.testGet(cached: true);
    setState(() {
      response.fold((l) => getMessage = l.errorMessage,
          (r) => getMessage = r.data.toString());
    });
  }

  void _testDelete() async {
    final response = await testRepository.testDelete();
    setState(() {
      response.fold((l) => deleteMessage = l.errorMessage,
          (r) => deleteMessage = r.data.toString());
    });
  }

  void _testPatch() async {
    final response = await testRepository.testPatch();
    setState(() {
      response.fold((l) => patchMessage = l.errorMessage,
          (r) => patchMessage = r.data.toString());
    });
  }

  void _testPost() async {
    final response = await testRepository.testPost();
    setState(() {
      response.fold((l) => postMessage = l.errorMessage,
          (r) => postMessage = r.data.toString());
    });
  }

  void _testPut() async {
    final response = await testRepository.testPut();
    setState(() {
      response.fold((l) => putMessage = l.errorMessage,
          (r) => putMessage = r.data.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DIO HTTP Flutter plugin test'),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () => _testGet(),
                child: const Text("GET"),
              ),
              Text(getMessage),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testDelete(),
                child: const Text("DELETE"),
              ),
              Text(deleteMessage),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testPatch(),
                child: const Text("PATCH"),
              ),
              Text(patchMessage),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testPost(),
                child: const Text("POST"),
              ),
              Text(postMessage),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testPut(),
                child: const Text("PUT"),
              ),
              Text(putMessage),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
