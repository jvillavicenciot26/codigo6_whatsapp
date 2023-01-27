import 'package:codigo6_whatsapp/Models/chat_model.dart';
import 'package:codigo6_whatsapp/Models/message_model.dart';
import 'package:codigo6_whatsapp/Models/states_model.dart';

class DataDummy {
  List<ChatModel> chats = [
    ChatModel(
      avatar:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Daniel Arias",
      message: "Hola como estas?",
      time: "14:23",
      date: "12/02",
      isTyping: false,
      countMessage: 3,
    ),
    ChatModel(
      avatar:
          "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Roxana Maldonado Diaz",
      message: "Hola como estas?",
      time: "11:23",
      date: "31/02",
      isTyping: true,
      countMessage: 0,
    ),
    ChatModel(
      avatar:
          "https://images.pexels.com/photos/773371/pexels-photo-773371.jpeg",
      name: "Angela Torres Durán",
      message: "Ya eh enviado lo solicitado",
      time: "05:23",
      date: "20/02",
      isTyping: false,
      countMessage: 0,
    ),
  ];

  List<MessageModel> messages = [
    MessageModel(
      message: "Hola",
      type: "me",
      time: "10:30",
    ),
    MessageModel(
      message: "Hola, cómo estas",
      type: "other",
      time: "10:31",
    ),
    MessageModel(
      message: "Bien, ando practicando",
      type: "other",
      time: "10:32",
    ),
  ];

  List<StatesModel> states = [
    StatesModel(
      image:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Daniel Arias",
      datetime: "20:23",
      publish: false,
    ),
    StatesModel(
      image:
          "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Roxana Maldonado Diaz",
      datetime: "14:37",
      publish: true,
    ),
    StatesModel(
      image: "https://images.pexels.com/photos/773371/pexels-photo-773371.jpeg",
      name: "Angela Torres Durán",
      datetime: "11:15",
      publish: false,
    ),
  ];
}
