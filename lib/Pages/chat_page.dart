import 'package:codigo6_whatsapp/Data/data_dummy.dart';
import 'package:codigo6_whatsapp/widgets/item_chat_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  DataDummy data = DataDummy();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.chats.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemChatWidget(
          dataChat: data.chats[index],
        );
      },
    );
  }
}
