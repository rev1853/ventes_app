import 'package:get/get.dart';
import 'package:ventes/app/network/contracts/auth_contract.dart';
import 'package:ventes/app/network/presenters/auth_presenter.dart';

class SigninDataSource {
  AuthPresenter presenter = AuthPresenter();
  final _isLoading = Rx<bool>(false);

  bool get isLoading => _isLoading.value;

  set authContract(AuthContract contract) => presenter.authContract = contract;
  set isLoading(bool value) => _isLoading.value = value;

  void signin(Map<String, dynamic> credentials) {
    isLoading = true;
    presenter.signIn(credentials);
  }
}
