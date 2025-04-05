import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:truck_management_app/service_locator.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<bool> isSignedIn();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    await getIt<FlutterSecureStorage>().write(key: 'token', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await getIt<FlutterSecureStorage>().read(key: 'token');
  }

  @override
  Future<void> deleteToken() async {
    await getIt<FlutterSecureStorage>().delete(key: 'token');
  }

  @override
  Future<bool> isSignedIn() async {
    final token = await getToken();
    return token != null;
  }
}
