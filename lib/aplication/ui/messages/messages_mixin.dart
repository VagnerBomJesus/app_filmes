import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messagesListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
          duration: Duration(seconds: 3),
          // backgroundColor:  (model.type == MessageType.error ? Colors.red : Colors.blue),
        ); /*
        Get.snackbar(
          '',
          '',
          duration: Duration(seconds: 3),
          backgroundColor: model.type.color(),
          titleText: Text(
            model.title,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            model.message,
            style: TextStyle(
              color: Colors.white30,
              fontWeight: FontWeight.w100,
              //fontSize: 15,
            ),
          ),
          //icon: Icon(Icons.access_alarm_rounded),
        );*/
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });

  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;

  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType {
  error,
  info,
}

extension MessageTypeExtencion on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[400] ?? Colors.red;

      case MessageType.info:
        return Colors.blue[100] ?? Colors.blue;
    }
  }
}
