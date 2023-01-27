import 'package:codigo6_whatsapp/Models/chat_model.dart';
import 'package:codigo6_whatsapp/Pages/chat_detail_page.dart';
import 'package:flutter/material.dart';

class ItemChatWidget extends StatelessWidget {
  //Map<String, String> dataChat;
  ChatModel dataChat;
  ItemChatWidget({required this.dataChat});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailPage(
                image: dataChat.avatar,
                name: dataChat.name,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 22,
          backgroundImage: NetworkImage(
            dataChat.avatar,
          ),
        ),
        title: Text(
          dataChat.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          // operadores ternarios condicion booleanda ? verdadero : falso
          // Si dataChat.isTyping es verdadero, "Escribiendo" sino dataChat.message
          dataChat.isTyping ? "Escribiendo..." : dataChat.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: dataChat.isTyping ? Colors.indigo : Colors.black54,
              fontWeight:
                  dataChat.isTyping ? FontWeight.bold : FontWeight.normal),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dataChat.time,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
                color: Colors.black54,
              ),
            ),
            //Si se tiene mas de un mensaje muestra el container
            dataChat.countMessage > 0
                ? Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.indigo, shape: BoxShape.circle),
                    child: Text(
                      dataChat.countMessage.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
