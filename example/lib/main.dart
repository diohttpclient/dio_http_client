import 'package:dio_http_client/network/app_http_client.dart';
import 'package:flutter/material.dart';

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
    client = AppHttpClient(debug: true);
    testRepository = TestRepositoryImpl(client);
  }

  String getMessage = '';
  String deleteMessage = '';
  String patchMessage = '';
  String postMessage = '';
  String putMessage = '';

  void _testGet() async {
    final _response = await testRepository.testGet();
    setState(() {
      _response.fold((l) => getMessage = l.errorMessage,
          (r) => getMessage = r.data.toString());
    });
  }

  void _testDelete() async {
    final _response = await testRepository.testDelete();
    setState(() {
      _response.fold((l) => deleteMessage = l.errorMessage,
          (r) => deleteMessage = r.data.toString());
    });
  }

  void _testPatch() async {
    final _response = await testRepository.testPatch();
    setState(() {
      _response.fold((l) => patchMessage = l.errorMessage,
          (r) => patchMessage = r.data.toString());
    });
  }

  void _testPost() async {
    final _response = await testRepository.testPost();
    setState(() {
      _response.fold((l) => postMessage = l.errorMessage,
          (r) => postMessage = r.data.toString());
    });
  }

  void _testPut() async {
    final _response = await testRepository.testPut();
    setState(() {
      _response.fold((l) => putMessage = l.errorMessage,
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
                child: Text("GET"),
              ),
              Text(getMessage),
              SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testDelete(),
                child: Text("DELETE"),
              ),
              Text(deleteMessage),
              SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testPatch(),
                child: Text("PATCH"),
              ),
              Text(patchMessage),
              SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testPost(),
                child: Text("POST"),
              ),
              Text(postMessage),
              SizedBox(height: 24),
              MaterialButton(
                onPressed: () => _testPut(),
                child: Text("PUT"),
              ),
              Text(putMessage),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
