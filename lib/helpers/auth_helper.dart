import 'package:get_storage/get_storage.dart';
import 'package:ventes/models/auth_model.dart';

class AuthHelper {
  static GetStorage get container => GetStorage("VentesAuth");
  static const String idKey = "userId";
  static const String tokenKey = "jwtToken";
  static var userId = ReadWriteValue<int?>(AuthHelper.idKey, null, () => AuthHelper.container);
  static var jwtToken = ReadWriteValue<String?>(AuthHelper.tokenKey, null, () => AuthHelper.container);

  Future<bool> save(AuthModel authModel) async {
    userId.val = authModel.userId;
    jwtToken.val = authModel.jwtToken;
    return check();
  }

  bool check() {
    return jwtToken.val != null;
  }

  Future<AuthModel?> get() async {
    if (check()) {
      int? _userId = userId.val;
      String? _jwtToken = jwtToken.val;
      return AuthModel(userId: _userId, jwtToken: _jwtToken);
    }
    return null;
  }

  Future<bool> destroy() async {
    userId.val = null;
    jwtToken.val = null;
    return check();
  }
}