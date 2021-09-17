import 'package:app_filmes/aplication/ui/loader/loader_mixin.dart';
import 'package:app_filmes/aplication/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;

  final message = Rxn<MessageModel>();
  final LoginService _loginService;
  LoginController({
    required LoginService loginservice,
  }) : _loginService = loginservice;

  @override
  void onInit() {
    loaderListener(loading);
    messagesListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      //await Future.delayed(Duration(seconds: 2));
      //await 3.seconds.delay();
      await _loginService.login();
      loading(false);

      message(
        MessageModel.info(
            title: "Sucesso", message: "Login efetuado com sucesso"),
      );
    } catch (e, s) {
      print('Erro : $e');
      print('Stack Erro : $s');
      loading(false);
      message(
        MessageModel.error(
            title: "Logim Error", message: "Erro ao realizar o login"),
      );
    }
  }
}
