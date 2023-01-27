import 'package:codigo6_whatsapp/Data/data_dummy.dart';
import 'package:codigo6_whatsapp/Models/chat_model.dart';
import 'package:codigo6_whatsapp/Models/message_model.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  String image;
  String name;

  ChatDetailPage({required this.image, required this.name});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  DataDummy data = DataDummy();
  bool isTyping = false;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E1D8),
      appBar: AppBar(
        leadingWidth: 20,
        //leading: icono de app bar para retroceder
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white12,
              backgroundImage: NetworkImage(
                widget.image,
              ),
            ),
            const SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Ult. Conexion hoy 11:00 am",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center, //Como se distribuiran los hijos
        clipBehavior: Clip.none, //Define el corte que tendran los hijos
        children: [
          ListView.builder(
            itemCount: data.messages.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: data.messages[index].type == "me"
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: data.messages[index].type == "me"
                        ? Color(0xffE1FFC6)
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(10.0),
                      topLeft: data.messages[index].type == "me"
                          ? const Radius.circular(10.0)
                          : const Radius.circular(0.0),
                      topRight: data.messages[index].type == "me"
                          ? const Radius.circular(0.0)
                          : const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment
                              .baseline, //CrossAxisAlignment.baseline exige colocar textBaseline
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              data.messages[index].message,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 6,
                        child: Row(
                          children: [
                            Text(
                              data.messages[index].time,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black45,
                              ),
                            ),
                            const Icon(
                              Icons.check,
                              size: 13.0,
                              color: Color(0xff53BD3B),
                            ),
                            const Icon(
                              Icons.check,
                              size: 13.0,
                              color: Color(0xff53BD3B),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.transparent,
              child: Container(
                color: Color(0xffE9E1D8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        onChanged: (String value) {
                          if (value.isEmpty) {
                            isTyping = false;
                          } else {
                            isTyping = true;
                          }
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Mensaje",
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize
                                .min, //Establece la longitud del row en el eje principal
                            children: const [
                              Icon(
                                Icons.attach_file,
                                color: Color(0xff8796A2),
                              ),
                              Icon(
                                Icons.camera_alt,
                                color: Color(0xff8796A2),
                              ),
                              SizedBox(
                                width: 12,
                              )
                            ],
                          ),
                          prefixIcon: const Icon(
                            Icons.emoji_emotions,
                            color: Color(0xff8796A2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      //permite programar acciones para el widget hijo
                      onTap: () {
                        if (messageController.text.isNotEmpty) {
                          DateTime now = DateTime.now();
                          data.messages.add(
                            MessageModel(
                              message: messageController.text,
                              type: "me",
                              time:
                                  "${now.hour.toString()}:${now.minute.toString()}",
                            ),
                          );
                          messageController.clear();
                          isTyping = false;
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.indigo,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isTyping ? Icons.send : Icons.mic,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundColor: Colors.indigo,
                    //   radius: 25.4,
                    //   child: Icon(
                    //     Icons.mic,
                    //     size: 30,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
        // [
        //   Container(
        //     height: 200,
        //     width: 200,
        //     color: Colors.amber,
        //     child: Stack(
        //       clipBehavior: Clip.none,
        //       children: [
        //         Positioned(
        //           top: -30,
        //           right: -20,
        //           child: Container(
        //             width: 100,
        //             height: 100,
        //             color: Colors.pink,
        //           ),
        //         ),
        //         Container(
        //           width: 50,
        //           height: 50,
        //           color: Colors.grey,
        //         ),
        //       ],
        //     ),
        //   ),
        //   Positioned(
        //     bottom: -50,
        //     right: -50,
        //     child: Container(
        //       height: 150,
        //       width: 150,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle, //Le da forma al container
        //         color: Colors.red,
        //       ),
        //     ),
        //   ),
        //   //Positioned: Permite mover el hijo dentro o fuera del stack
        //   Positioned(
        //     top: 20,
        //     left: 10,
        //     child: Container(
        //       height: 70,
        //       width: 70,
        //       color: Colors.blue,
        //     ),
        //   ),
        //   Align(
        //     alignment: Alignment.topRight,
        //     child: Container(
        //       height: 60,
        //       width: 60,
        //       color: Colors.green,
        //     ),
        //   )
        // ],
      ),
    );
  }
}
