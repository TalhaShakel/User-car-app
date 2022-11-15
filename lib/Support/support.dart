import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:users_app/Support/chat.dart';
import 'package:users_app/global/global.dart';
import 'package:velocity_x/velocity_x.dart';

final messageDao = MessageDao();

class Support_page extends StatefulWidget {
  Support_page({super.key});

  @override
  State<Support_page> createState() => _Support_pageState();
}

class _Support_pageState extends State<Support_page> {
  var message = TextEditingController();

  void _sendMessage() {
    if (message.text.trim() != "") {
      final messag =
          Message(message.text, DateTime.now(), "${userModelCurrentInfo!.id}");
      messageDao.saveMessage(messag);
      message.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: "Support Chat".text.make(),
      ),
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
            query: messageDao.getMessageQuery(),
            itemBuilder: (context, snapshot, animation, index) {
              final json = snapshot.value as Map<dynamic, dynamic>;
              final message = Message.fromJson(json);
              return Row(
                mainAxisAlignment: (message.sender == userModelCurrentInfo!.id)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: (message.sender == userModelCurrentInfo!.id)
                            ? Colors.grey
                            : Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        message.text.toString(),
                        style: TextStyle(
                          color: theme.primaryColor,
                        ),
                      )),
                ],
              );
            },
          )),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: message,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter message"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    try {
                      _sendMessage();
                    } catch (e) {
                      print(e);
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
