import 'package:app_filmes/aplication/ui/loader/loader_mixin.dart';
import 'package:app_filmes/aplication/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;

  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    loaderListener(loading);
    messagesListener(message);
  }

  Future<void> login() async {
    loading(true);
    //await Future.delayed(Duration(seconds: 2));
    await 3.seconds.delay();
    loading(false);
    message(
      MessageModel.error(title: "Titulo Erro", message: "Mensagem de Erro"),
    );
    await 1.seconds.delay();
    message(
      MessageModel.info(title: "Titulo Erro", message: "Mensagem de Erro"),
    );
  }
}
