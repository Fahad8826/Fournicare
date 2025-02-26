// import 'package:flutter/material.dart';
// import 'package:fourincare/chat_scren/controller/controller.dart';
// import 'package:get/get.dart';

// class ChatScreen extends StatefulWidget {
//   final String id;

//   const ChatScreen({super.key, required this.id});
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<Map<String, dynamic>> _messages = [];
//   final TextEditingController _controller = TextEditingController();
//   final chatC = Get.put(ChatController());
//   void _sendMessage() {
//     if (_controller.text.trim().isEmpty) return;
//     chatC.sendMessage(widget.id, _controller.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Screen'),
//       ),
//       body: GetBuilder<ChatController>(
//         initState: (state) {
//           chatC.fetchMessages(widget.id);
//         },
//         builder: (controller) {
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   reverse: true,
//                   itemCount: controller.messages.length,
//                   itemBuilder: (context, index) {
//                     final message = controller
//                         .messages[controller.messages.length - 1 - index];
//                     return Align(
//                       alignment: message['isUser']
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: Container(
//                         margin:
//                             EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: message['isUser']
//                               ? Colors.blueAccent
//                               : Colors.grey[300],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Text(
//                           message['message'],
//                           style: TextStyle(
//                             color: message['isUser']
//                                 ? Colors.white
//                                 : Colors.black87,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(
//                           hintText: 'Type a message',
//                         ),
//                         onSubmitted: (value) => _sendMessage(),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.send),
//                       onPressed: _sendMessage,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fourincare/chat_scren/controller/controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final String id;

  const ChatScreen({super.key, required this.id});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final chatC = Get.put(ChatController());

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    chatC.sendMessage(widget.id, _controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        elevation: 4,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<ChatController>(
                initState: (state) => chatC.fetchMessages(widget.id),
                builder: (controller) {
                  return ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller
                          .messages[controller.messages.length - 1 - index];
                      return Align(
                        alignment: message['isUser']
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.all(12),
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75),
                          decoration: BoxDecoration(
                            color: message['isUser']
                                ? Colors.blueAccent
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            message['message'],
                            style: TextStyle(
                              color: message['isUser']
                                  ? Colors.white
                                  : Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                        onSubmitted: (value) => _sendMessage(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
