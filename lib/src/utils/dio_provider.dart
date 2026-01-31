import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'http://localhost:5011',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}
