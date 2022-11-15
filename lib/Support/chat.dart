// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:users_app/Support/support.dart';
// import 'package:users_app/authentication/login_screen.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:users_app/global/global.dart';

class MessageDao {
  final DatabaseReference _messagesRef = FirebaseDatabase.instance
      .reference()
      .child('users/${userModelCurrentInfo!.id}/messages');
  void saveMessage(Message message) {
    _messagesRef.push().set(message.toJson());
  }

  Query getMessageQuery() {
    return _messagesRef;
  }
}

class Message {
  final String text;
  final DateTime date;
  final String sender;

  Message(this.text, this.date, this.sender);

  Message.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        sender = json["sender"] as String,
        text = json['text'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'date': date.toString(),
        'text': text,
        "sender": sender.toString(),
      };
}


// // import 'login.dart';
// // import 'message.dart';

// class chat extends StatelessWidget {
//   const chat({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class chatpage extends StatefulWidget {
//   String email;
//   chatpage({required this.email});
//   @override
//   _chatpageState createState() => _chatpageState(email: email);
// }

// class _chatpageState extends State<chatpage> {
//   String email;
//   _chatpageState({required this.email});

//   final fs = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   final TextEditingController message = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'data',
//         ),
//         actions: [
//           MaterialButton(
//             onPressed: () {
//               _auth.signOut().whenComplete(() {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => LoginScreen(),
//                   ),
//                 );
//               });
//             },
//             child: Text(
//               "signOut",
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.79,
//               child: Support_page(
//                 email: email,
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: message,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.purple[100],
//                       hintText: 'message',
//                       enabled: true,
//                       contentPadding: const EdgeInsets.only(
//                           left: 14.0, bottom: 8.0, top: 8.0),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: new BorderSide(color: Colors.purple),
//                         borderRadius: new BorderRadius.circular(10),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: new BorderSide(color: Colors.purple),
//                         borderRadius: new BorderRadius.circular(10),
//                       ),
//                     ),
//                     validator: (value) {},
//                     onSaved: (value) {
//                       message.text = value!;
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     if (message.text.isNotEmpty) {
//                       fs.collection('Messages').doc().set({
//                         'message': message.text.trim(),
//                         'time': DateTime.now(),
//                         'email': email,
//                       });

//                       message.clear();
//                     }
//                   },
//                   icon: Icon(Icons.send_sharp),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
