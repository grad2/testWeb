import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  FlutterSecureStorage get secure => const FlutterSecureStorage();

  @singleton
  Dio get httpClient => Dio(
        BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ),
      );
}
